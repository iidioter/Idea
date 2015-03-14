//
//  IPAdress.h
//  Idea
//
//  Created by Harry Tsai on 14-6-29.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#ifndef __IPADRESS_H__
#define __IPADRESS_H__


#include "IdeaDef.h"


//#define __IP_ADRESS__                        __ON__


#define MAXADDRS                             32

//#if __IP_ADRESS__

BEGIN_DECLS

extern char          *if_names[MAXADDRS];
extern char          *ip_names[MAXADDRS];
extern char          *hw_addrs[MAXADDRS];
extern unsigned long ip_addrs[MAXADDRS];

// Function prototypes

void InitAddresses();
void FreeAddresses();
void GetIPAddresses();
void GetHWAddresses();

END_DECLS

//#endif

#endif /* __IPADRESS_H__ */
