//
//  UIDevice+IP.m
//  H264Server
//
//  Created by Harry on 15/2/11.
//  Copyright (c) 2015年 Harry. All rights reserved.
//

#import "UIDevice+IP.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/sockio.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <net/ethernet.h>


#define BUFFERSIZE                     4000



@implementation UIDevice (IP)

+ (NSDictionary *)IP
{
   NSMutableDictionary  *stIPs   = [NSMutableDictionary dictionary];
   
   NSInteger             len                 = 0;
   int                   flags               = 0;
   char                  buffer[BUFFERSIZE]  = {0};
   char                 *ptr                 = NULL;
   char                  lastname[IFNAMSIZ]  = {0};
   char                 *cptr                = NULL;
   struct ifconf         ifc                 = {0};
   struct ifreq         *ifr                 = NULL;
   struct ifreq          ifrcopy             = {0};

   
   struct sockaddr_in   *sin                 = NULL;
   int                   sockfd              = -1;
   
   NSString             *szIP                = nil;
   NSString             *szName              = nil;
   
   do
   {
      sockfd = socket(AF_INET, SOCK_DGRAM, 0);
      
      if (-1 == sockfd)
      {
         break;
         
      } /* End if () */
      
      ifc.ifc_len = BUFFERSIZE;
      ifc.ifc_buf = buffer;

      if (ioctl(sockfd, SIOCGIFCONF, &ifc) < 0)
      {
         perror("ioctl error");
         break;

      } /* End if () */
      
      for (ptr = buffer; ptr < buffer + ifc.ifc_len; )
      {
         ifr = (struct ifreq *)ptr;
         len = MAX(sizeof(struct sockaddr), ifr->ifr_addr.sa_len);
         ptr += sizeof(ifr->ifr_name) + len; // for next one in buffer

         if (ifr->ifr_addr.sa_family != AF_INET)
         {
            continue;  // ignore if not desired address family

         } /* End if () */

         if ((cptr = (char *)strchr(ifr->ifr_name, ':')) != NULL)
         {
            *cptr = 0;     // replace colon will null

         } /* End if () */

         if (strncmp(lastname, ifr->ifr_name, IFNAMSIZ) == 0)
         {
            continue;  /* already processed this interface */

         } /* End if () */

         memcpy(lastname, ifr->ifr_name, IFNAMSIZ);
         
         ifrcopy = *ifr;
         ioctl(sockfd, SIOCGIFFLAGS, &ifrcopy);
         flags = ifrcopy.ifr_flags;
         if ((flags & IFF_UP) == 0)
         {
            continue;  // ignore if interface not up

         } /* End if () */
         
         szIP  = [NSString stringWithCString:ifr->ifr_name
                                    encoding:NSUTF8StringEncoding];
         
         sin = (struct sockaddr_in *)&ifr->ifr_addr;
//         strcpy(temp, inet_ntoa(sin->sin_addr));
         szName= [NSString stringWithCString:inet_ntoa(sin->sin_addr)
                                    encoding:NSUTF8StringEncoding];

         
         [stIPs setObject:szIP forKey:szName];

      } /* End for () */

   } while (0); /* End do while () */

   return stIPs;
}

@end




