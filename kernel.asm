
kernel.bin:     формат файла elf32-i386


Дизассемблирование раздела .multiboot:

00100000 <multiboot_header-0xc>:
  100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
  100006:	00 00                	add    %al,(%eax)
  100008:	fe 4f 52             	decb   0x52(%edi)
  10000b:	e4                 	in     $0x2,%al

0010000c <multiboot_header>:
  10000c:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
  100012:	00 00                	add    %al,(%eax)
  100014:	fe 4f 52             	decb   0x52(%edi)
  100017:	e4                   	.byte 0xe4

Дизассемблирование раздела .text:

00100040 <_start>:
  100040:	bc 80 2f 11 00       	mov    $0x112f80,%esp
  100045:	e8 86 17 00 00       	call   1017d0 <kernel_main>

0010004a <_start.hang>:
  10004a:	f4                   	hlt
  10004b:	eb fd                	jmp    10004a <_start.hang>
  10004d:	66 90                	xchg   %ax,%ax
  10004f:	66 90                	xchg   %ax,%ax
  100051:	66 90                	xchg   %ax,%ax
  100053:	66 90                	xchg   %ax,%ax
  100055:	66 90                	xchg   %ax,%ax
  100057:	66 90                	xchg   %ax,%ax
  100059:	66 90                	xchg   %ax,%ax
  10005b:	66 90                	xchg   %ax,%ax
  10005d:	66 90                	xchg   %ax,%ax
  10005f:	66 90                	xchg   %ax,%ax
  100061:	66 90                	xchg   %ax,%ax
  100063:	66 90                	xchg   %ax,%ax
  100065:	66 90                	xchg   %ax,%ax
  100067:	66 90                	xchg   %ax,%ax
  100069:	66 90                	xchg   %ax,%ax
  10006b:	66 90                	xchg   %ax,%ax
  10006d:	66 90                	xchg   %ax,%ax
  10006f:	66 90                	xchg   %ax,%ax
  100071:	66 90                	xchg   %ax,%ax
  100073:	66 90                	xchg   %ax,%ax
  100075:	66 90                	xchg   %ax,%ax
  100077:	66 90                	xchg   %ax,%ax
  100079:	66 90                	xchg   %ax,%ax
  10007b:	66 90                	xchg   %ax,%ax
  10007d:	66 90                	xchg   %ax,%ax
  10007f:	90                   	nop

00100080 <app_hello_world>:
  100080:	56                   	push   %esi
  100081:	b8 68 00 00 00       	mov    $0x68,%eax
  100086:	ba 2d 1f 10 00       	mov    $0x101f2d,%edx
  10008b:	53                   	push   %ebx
  10008c:	8b 1d 60 2f 10 00    	mov    0x102f60,%ebx
  100092:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100098:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10009f:	00 
  1000a0:	83 c2 01             	add    $0x1,%edx
  1000a3:	3c 0a                	cmp    $0xa,%al
  1000a5:	74 33                	je     1000da <app_hello_world+0x5a>
  1000a7:	0f b7 0d 78 5f 11 00 	movzwl 0x115f78,%ecx
  1000ae:	0f b7 35 7a 5f 11 00 	movzwl 0x115f7a,%esi
  1000b5:	80 cc 0f             	or     $0xf,%ah
  1000b8:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
  1000bb:	c1 e1 04             	shl    $0x4,%ecx
  1000be:	01 f1                	add    %esi,%ecx
  1000c0:	66 89 04 4b          	mov    %ax,(%ebx,%ecx,2)
  1000c4:	0f b7 05 7a 5f 11 00 	movzwl 0x115f7a,%eax
  1000cb:	83 c0 01             	add    $0x1,%eax
  1000ce:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  1000d4:	66 83 f8 50          	cmp    $0x50,%ax
  1000d8:	76 10                	jbe    1000ea <app_hello_world+0x6a>
  1000da:	66 83 05 78 5f 11 00 	addw   $0x1,0x115f78
  1000e1:	01 
  1000e2:	31 c0                	xor    %eax,%eax
  1000e4:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  1000ea:	66 0f be 02          	movsbw (%edx),%ax
  1000ee:	81 fa 3a 1f 10 00    	cmp    $0x101f3a,%edx
  1000f4:	75 aa                	jne    1000a0 <app_hello_world+0x20>
  1000f6:	5b                   	pop    %ebx
  1000f7:	5e                   	pop    %esi
  1000f8:	c3                   	ret
  1000f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00100100 <nl>:
  100100:	66 83 05 78 5f 11 00 	addw   $0x1,0x115f78
  100107:	01 
  100108:	31 c0                	xor    %eax,%eax
  10010a:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  100110:	c3                   	ret
  100111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100118:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10011f:	00 

00100120 <putc>:
  100120:	0f b7 05 78 5f 11 00 	movzwl 0x115f78,%eax
  100127:	0f b7 15 7a 5f 11 00 	movzwl 0x115f7a,%edx
  10012e:	66 0f be 4c 24 04    	movsbw 0x4(%esp),%cx
  100134:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100137:	c1 e0 04             	shl    $0x4,%eax
  10013a:	01 d0                	add    %edx,%eax
  10013c:	0f b6 54 24 08       	movzbl 0x8(%esp),%edx
  100141:	c1 e2 08             	shl    $0x8,%edx
  100144:	09 ca                	or     %ecx,%edx
  100146:	8b 0d 60 2f 10 00    	mov    0x102f60,%ecx
  10014c:	66 89 14 41          	mov    %dx,(%ecx,%eax,2)
  100150:	c3                   	ret
  100151:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100158:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10015f:	00 

00100160 <printc>:
  100160:	83 ec 04             	sub    $0x4,%esp
  100163:	0f b6 44 24 0c       	movzbl 0xc(%esp),%eax
  100168:	66 0f be 54 24 08    	movsbw 0x8(%esp),%dx
  10016e:	88 44 24 02          	mov    %al,0x2(%esp)
  100172:	80 fa 0a             	cmp    $0xa,%dl
  100175:	74 40                	je     1001b7 <printc+0x57>
  100177:	0f b7 05 78 5f 11 00 	movzwl 0x115f78,%eax
  10017e:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  100181:	0f b7 05 7a 5f 11 00 	movzwl 0x115f7a,%eax
  100188:	c1 e1 04             	shl    $0x4,%ecx
  10018b:	01 c1                	add    %eax,%ecx
  10018d:	0f b7 44 24 02       	movzwl 0x2(%esp),%eax
  100192:	c1 e0 08             	shl    $0x8,%eax
  100195:	09 d0                	or     %edx,%eax
  100197:	8b 15 60 2f 10 00    	mov    0x102f60,%edx
  10019d:	66 89 04 4a          	mov    %ax,(%edx,%ecx,2)
  1001a1:	0f b7 05 7a 5f 11 00 	movzwl 0x115f7a,%eax
  1001a8:	83 c0 01             	add    $0x1,%eax
  1001ab:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  1001b1:	66 83 f8 50          	cmp    $0x50,%ax
  1001b5:	76 10                	jbe    1001c7 <printc+0x67>
  1001b7:	66 83 05 78 5f 11 00 	addw   $0x1,0x115f78
  1001be:	01 
  1001bf:	31 c0                	xor    %eax,%eax
  1001c1:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  1001c7:	83 c4 04             	add    $0x4,%esp
  1001ca:	c3                   	ret
  1001cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001001d0 <print>:
  1001d0:	83 ec 10             	sub    $0x10,%esp
  1001d3:	0f b6 44 24 18       	movzbl 0x18(%esp),%eax
  1001d8:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  1001dc:	88 44 24 02          	mov    %al,0x2(%esp)
  1001e0:	66 0f be 01          	movsbw (%ecx),%ax
  1001e4:	84 c0                	test   %al,%al
  1001e6:	0f 84 81 00 00 00    	je     10026d <print+0x9d>
  1001ec:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1001f0:	0f b7 5c 24 02       	movzwl 0x2(%esp),%ebx
  1001f5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  1001f9:	89 74 24 08          	mov    %esi,0x8(%esp)
  1001fd:	8b 35 60 2f 10 00    	mov    0x102f60,%esi
  100203:	c1 e3 08             	shl    $0x8,%ebx
  100206:	66 90                	xchg   %ax,%ax
  100208:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10020f:	00 
  100210:	83 c1 01             	add    $0x1,%ecx
  100213:	3c 0a                	cmp    $0xa,%al
  100215:	74 32                	je     100249 <print+0x79>
  100217:	0f b7 15 78 5f 11 00 	movzwl 0x115f78,%edx
  10021e:	0f b7 3d 7a 5f 11 00 	movzwl 0x115f7a,%edi
  100225:	09 d8                	or     %ebx,%eax
  100227:	8d 14 92             	lea    (%edx,%edx,4),%edx
  10022a:	c1 e2 04             	shl    $0x4,%edx
  10022d:	01 fa                	add    %edi,%edx
  10022f:	66 89 04 56          	mov    %ax,(%esi,%edx,2)
  100233:	0f b7 05 7a 5f 11 00 	movzwl 0x115f7a,%eax
  10023a:	83 c0 01             	add    $0x1,%eax
  10023d:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  100243:	66 83 f8 50          	cmp    $0x50,%ax
  100247:	76 10                	jbe    100259 <print+0x89>
  100249:	66 83 05 78 5f 11 00 	addw   $0x1,0x115f78
  100250:	01 
  100251:	31 c0                	xor    %eax,%eax
  100253:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  100259:	66 0f be 01          	movsbw (%ecx),%ax
  10025d:	84 c0                	test   %al,%al
  10025f:	75 af                	jne    100210 <print+0x40>
  100261:	8b 5c 24 04          	mov    0x4(%esp),%ebx
  100265:	8b 74 24 08          	mov    0x8(%esp),%esi
  100269:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  10026d:	83 c4 10             	add    $0x10,%esp
  100270:	c3                   	ret
  100271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100278:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10027f:	00 

00100280 <app_echo>:
  100280:	83 ec 10             	sub    $0x10,%esp
  100283:	89 74 24 04          	mov    %esi,0x4(%esp)
  100287:	8b 74 24 14          	mov    0x14(%esp),%esi
  10028b:	89 7c 24 08          	mov    %edi,0x8(%esp)
  10028f:	8b 7c 24 18          	mov    0x18(%esp),%edi
  100293:	83 fe 01             	cmp    $0x1,%esi
  100296:	7e 56                	jle    1002ee <app_echo+0x6e>
  100298:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
  10029c:	89 1c 24             	mov    %ebx,(%esp)
  10029f:	bb 01 00 00 00       	mov    $0x1,%ebx
  1002a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1002a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1002af:	00 
  1002b0:	8b 2c 9f             	mov    (%edi,%ebx,4),%ebp
  1002b3:	0f be 45 00          	movsbl 0x0(%ebp),%eax
  1002b7:	84 c0                	test   %al,%al
  1002b9:	74 1a                	je     1002d5 <app_echo+0x55>
  1002bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1002c0:	6a 0f                	push   $0xf
  1002c2:	83 c5 01             	add    $0x1,%ebp
  1002c5:	50                   	push   %eax
  1002c6:	e8 95 fe ff ff       	call   100160 <printc>
  1002cb:	0f be 45 00          	movsbl 0x0(%ebp),%eax
  1002cf:	59                   	pop    %ecx
  1002d0:	5a                   	pop    %edx
  1002d1:	84 c0                	test   %al,%al
  1002d3:	75 eb                	jne    1002c0 <app_echo+0x40>
  1002d5:	6a 0f                	push   $0xf
  1002d7:	83 c3 01             	add    $0x1,%ebx
  1002da:	6a 20                	push   $0x20
  1002dc:	e8 7f fe ff ff       	call   100160 <printc>
  1002e1:	58                   	pop    %eax
  1002e2:	5a                   	pop    %edx
  1002e3:	39 de                	cmp    %ebx,%esi
  1002e5:	75 c9                	jne    1002b0 <app_echo+0x30>
  1002e7:	8b 1c 24             	mov    (%esp),%ebx
  1002ea:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  1002ee:	8b 74 24 04          	mov    0x4(%esp),%esi
  1002f2:	8b 7c 24 08          	mov    0x8(%esp),%edi
  1002f6:	c7 44 24 18 0f 00 00 	movl   $0xf,0x18(%esp)
  1002fd:	00 
  1002fe:	c7 44 24 14 39 1f 10 	movl   $0x101f39,0x14(%esp)
  100305:	00 
  100306:	83 c4 10             	add    $0x10,%esp
  100309:	e9 c2 fe ff ff       	jmp    1001d0 <print>
  10030e:	66 90                	xchg   %ax,%ax

00100310 <print_cords>:
  100310:	83 ec 14             	sub    $0x14,%esp
  100313:	0f b6 44 24 1c       	movzbl 0x1c(%esp),%eax
  100318:	8b 4c 24 20          	mov    0x20(%esp),%ecx
  10031c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  100320:	8b 54 24 18          	mov    0x18(%esp),%edx
  100324:	0f b7 1d 78 5f 11 00 	movzwl 0x115f78,%ebx
  10032b:	89 6c 24 10          	mov    %ebp,0x10(%esp)
  10032f:	88 44 24 02          	mov    %al,0x2(%esp)
  100333:	8b 44 24 24          	mov    0x24(%esp),%eax
  100337:	0f b7 2d 7a 5f 11 00 	movzwl 0x115f7a,%ebp
  10033e:	66 89 0d 7a 5f 11 00 	mov    %cx,0x115f7a
  100345:	66 a3 78 5f 11 00    	mov    %ax,0x115f78
  10034b:	0f b7 c8             	movzwl %ax,%ecx
  10034e:	66 0f be 02          	movsbw (%edx),%ax
  100352:	84 c0                	test   %al,%al
  100354:	0f 84 8d 00 00 00    	je     1003e7 <print_cords+0xd7>
  10035a:	89 74 24 08          	mov    %esi,0x8(%esp)
  10035e:	0f b7 74 24 02       	movzwl 0x2(%esp),%esi
  100363:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  100367:	8b 3d 60 2f 10 00    	mov    0x102f60,%edi
  10036d:	66 89 6c 24 02       	mov    %bp,0x2(%esp)
  100372:	c1 e6 08             	shl    $0x8,%esi
  100375:	eb 10                	jmp    100387 <print_cords+0x77>
  100377:	90                   	nop
  100378:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10037f:	00 
  100380:	0f b7 0d 78 5f 11 00 	movzwl 0x115f78,%ecx
  100387:	83 c2 01             	add    $0x1,%edx
  10038a:	3c 0a                	cmp    $0xa,%al
  10038c:	74 32                	je     1003c0 <print_cords+0xb0>
  10038e:	8d 2c 89             	lea    (%ecx,%ecx,4),%ebp
  100391:	0f b7 0d 7a 5f 11 00 	movzwl 0x115f7a,%ecx
  100398:	09 f0                	or     %esi,%eax
  10039a:	c1 e5 04             	shl    $0x4,%ebp
  10039d:	01 e9                	add    %ebp,%ecx
  10039f:	66 89 04 4f          	mov    %ax,(%edi,%ecx,2)
  1003a3:	0f b7 05 7a 5f 11 00 	movzwl 0x115f7a,%eax
  1003aa:	83 c0 01             	add    $0x1,%eax
  1003ad:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  1003b3:	66 83 f8 50          	cmp    $0x50,%ax
  1003b7:	76 19                	jbe    1003d2 <print_cords+0xc2>
  1003b9:	0f b7 0d 78 5f 11 00 	movzwl 0x115f78,%ecx
  1003c0:	31 c0                	xor    %eax,%eax
  1003c2:	83 c1 01             	add    $0x1,%ecx
  1003c5:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  1003cb:	66 89 0d 78 5f 11 00 	mov    %cx,0x115f78
  1003d2:	66 0f be 02          	movsbw (%edx),%ax
  1003d6:	84 c0                	test   %al,%al
  1003d8:	75 a6                	jne    100380 <print_cords+0x70>
  1003da:	0f b7 6c 24 02       	movzwl 0x2(%esp),%ebp
  1003df:	8b 74 24 08          	mov    0x8(%esp),%esi
  1003e3:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  1003e7:	66 89 2d 7a 5f 11 00 	mov    %bp,0x115f7a
  1003ee:	8b 6c 24 10          	mov    0x10(%esp),%ebp
  1003f2:	66 89 1d 78 5f 11 00 	mov    %bx,0x115f78
  1003f9:	8b 5c 24 04          	mov    0x4(%esp),%ebx
  1003fd:	83 c4 14             	add    $0x14,%esp
  100400:	c3                   	ret
  100401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100408:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10040f:	00 

00100410 <print_cords_local>:
  100410:	83 ec 14             	sub    $0x14,%esp
  100413:	0f b6 44 24 1c       	movzbl 0x1c(%esp),%eax
  100418:	8b 4c 24 18          	mov    0x18(%esp),%ecx
  10041c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  100420:	8b 5c 24 20          	mov    0x20(%esp),%ebx
  100424:	88 44 24 02          	mov    %al,0x2(%esp)
  100428:	8b 44 24 24          	mov    0x24(%esp),%eax
  10042c:	66 89 1d 7a 5f 11 00 	mov    %bx,0x115f7a
  100433:	66 a3 78 5f 11 00    	mov    %ax,0x115f78
  100439:	66 0f be 11          	movsbw (%ecx),%dx
  10043d:	84 d2                	test   %dl,%dl
  10043f:	0f 84 93 00 00 00    	je     1004d8 <print_cords_local+0xc8>
  100445:	89 74 24 08          	mov    %esi,0x8(%esp)
  100449:	0f b7 74 24 02       	movzwl 0x2(%esp),%esi
  10044e:	89 6c 24 10          	mov    %ebp,0x10(%esp)
  100452:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  100456:	8b 3d 60 2f 10 00    	mov    0x102f60,%edi
  10045c:	c1 e6 08             	shl    $0x8,%esi
  10045f:	90                   	nop
  100460:	89 d8                	mov    %ebx,%eax
  100462:	80 fa 0a             	cmp    $0xa,%dl
  100465:	75 1c                	jne    100483 <print_cords_local+0x73>
  100467:	83 c0 01             	add    $0x1,%eax
  10046a:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  100470:	66 83 f8 50          	cmp    $0x50,%ax
  100474:	77 3f                	ja     1004b5 <print_cords_local+0xa5>
  100476:	66 0f be 11          	movsbw (%ecx),%dx
  10047a:	80 fa 0a             	cmp    $0xa,%dl
  10047d:	74 36                	je     1004b5 <print_cords_local+0xa5>
  10047f:	84 d2                	test   %dl,%dl
  100481:	74 49                	je     1004cc <print_cords_local+0xbc>
  100483:	0f b7 2d 78 5f 11 00 	movzwl 0x115f78,%ebp
  10048a:	0f b7 c0             	movzwl %ax,%eax
  10048d:	09 f2                	or     %esi,%edx
  10048f:	83 c1 01             	add    $0x1,%ecx
  100492:	8d 6c ad 00          	lea    0x0(%ebp,%ebp,4),%ebp
  100496:	c1 e5 04             	shl    $0x4,%ebp
  100499:	01 e8                	add    %ebp,%eax
  10049b:	66 89 14 47          	mov    %dx,(%edi,%eax,2)
  10049f:	0f b7 05 7a 5f 11 00 	movzwl 0x115f7a,%eax
  1004a6:	83 c0 01             	add    $0x1,%eax
  1004a9:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  1004af:	66 83 f8 50          	cmp    $0x50,%ax
  1004b3:	76 c1                	jbe    100476 <print_cords_local+0x66>
  1004b5:	66 83 05 78 5f 11 00 	addw   $0x1,0x115f78
  1004bc:	01 
  1004bd:	66 89 1d 7a 5f 11 00 	mov    %bx,0x115f7a
  1004c4:	66 0f be 11          	movsbw (%ecx),%dx
  1004c8:	84 d2                	test   %dl,%dl
  1004ca:	75 94                	jne    100460 <print_cords_local+0x50>
  1004cc:	8b 74 24 08          	mov    0x8(%esp),%esi
  1004d0:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  1004d4:	8b 6c 24 10          	mov    0x10(%esp),%ebp
  1004d8:	8b 5c 24 04          	mov    0x4(%esp),%ebx
  1004dc:	83 c4 14             	add    $0x14,%esp
  1004df:	c3                   	ret

001004e0 <putc_cords>:
  1004e0:	0f b6 54 24 08       	movzbl 0x8(%esp),%edx
  1004e5:	66 0f be 4c 24 04    	movsbw 0x4(%esp),%cx
  1004eb:	8b 44 24 10          	mov    0x10(%esp),%eax
  1004ef:	c1 e2 08             	shl    $0x8,%edx
  1004f2:	09 ca                	or     %ecx,%edx
  1004f4:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1004f7:	8b 0d 60 2f 10 00    	mov    0x102f60,%ecx
  1004fd:	c1 e0 04             	shl    $0x4,%eax
  100500:	03 44 24 0c          	add    0xc(%esp),%eax
  100504:	66 89 14 41          	mov    %dx,(%ecx,%eax,2)
  100508:	c3                   	ret
  100509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00100510 <puts>:
  100510:	83 ec 10             	sub    $0x10,%esp
  100513:	0f b6 44 24 18       	movzbl 0x18(%esp),%eax
  100518:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  10051c:	88 44 24 02          	mov    %al,0x2(%esp)
  100520:	66 0f be 01          	movsbw (%ecx),%ax
  100524:	84 c0                	test   %al,%al
  100526:	0f 84 87 00 00 00    	je     1005b3 <puts+0xa3>
  10052c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  100530:	0f b7 5c 24 02       	movzwl 0x2(%esp),%ebx
  100535:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  100539:	89 74 24 08          	mov    %esi,0x8(%esp)
  10053d:	8b 35 60 2f 10 00    	mov    0x102f60,%esi
  100543:	c1 e3 08             	shl    $0x8,%ebx
  100546:	eb 38                	jmp    100580 <puts+0x70>
  100548:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10054f:	00 
  100550:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100557:	00 
  100558:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10055f:	00 
  100560:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100567:	00 
  100568:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10056f:	00 
  100570:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100577:	00 
  100578:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10057f:	00 
  100580:	0f b7 15 78 5f 11 00 	movzwl 0x115f78,%edx
  100587:	0f b7 3d 7a 5f 11 00 	movzwl 0x115f7a,%edi
  10058e:	09 d8                	or     %ebx,%eax
  100590:	83 c1 01             	add    $0x1,%ecx
  100593:	8d 14 92             	lea    (%edx,%edx,4),%edx
  100596:	c1 e2 04             	shl    $0x4,%edx
  100599:	01 fa                	add    %edi,%edx
  10059b:	66 89 04 56          	mov    %ax,(%esi,%edx,2)
  10059f:	66 0f be 01          	movsbw (%ecx),%ax
  1005a3:	84 c0                	test   %al,%al
  1005a5:	75 d9                	jne    100580 <puts+0x70>
  1005a7:	8b 5c 24 04          	mov    0x4(%esp),%ebx
  1005ab:	8b 74 24 08          	mov    0x8(%esp),%esi
  1005af:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  1005b3:	83 c4 10             	add    $0x10,%esp
  1005b6:	c3                   	ret
  1005b7:	90                   	nop
  1005b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1005bf:	00 

001005c0 <return_cur>:
  1005c0:	31 c0                	xor    %eax,%eax
  1005c2:	31 d2                	xor    %edx,%edx
  1005c4:	31 c9                	xor    %ecx,%ecx
  1005c6:	66 a3 7c 5f 11 00    	mov    %ax,0x115f7c
  1005cc:	66 89 15 7a 5f 11 00 	mov    %dx,0x115f7a
  1005d3:	66 89 0d 78 5f 11 00 	mov    %cx,0x115f78
  1005da:	c3                   	ret
  1005db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

001005e0 <bck>:
  1005e0:	0f b7 05 7a 5f 11 00 	movzwl 0x115f7a,%eax
  1005e7:	ba 01 00 00 00       	mov    $0x1,%edx
  1005ec:	66 83 e8 01          	sub    $0x1,%ax
  1005f0:	74 09                	je     1005fb <bck+0x1b>
  1005f2:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  1005f8:	0f b7 d0             	movzwl %ax,%edx
  1005fb:	0f b7 05 78 5f 11 00 	movzwl 0x115f78,%eax
  100602:	b9 2f 00 00 00       	mov    $0x2f,%ecx
  100607:	8d 04 80             	lea    (%eax,%eax,4),%eax
  10060a:	c1 e0 04             	shl    $0x4,%eax
  10060d:	01 d0                	add    %edx,%eax
  10060f:	8b 15 60 2f 10 00    	mov    0x102f60,%edx
  100615:	66 89 0c 42          	mov    %cx,(%edx,%eax,2)
  100619:	c3                   	ret
  10061a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00100620 <clr>:
  100620:	8b 0d 60 2f 10 00    	mov    0x102f60,%ecx
  100626:	8d 91 a0 00 00 00    	lea    0xa0(%ecx),%edx
  10062c:	81 c1 40 10 00 00    	add    $0x1040,%ecx
  100632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100638:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10063f:	00 
  100640:	8d 82 60 ff ff ff    	lea    -0xa0(%edx),%eax
  100646:	eb 18                	jmp    100660 <clr+0x40>
  100648:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10064f:	00 
  100650:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100657:	00 
  100658:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10065f:	00 
  100660:	66 c7 00 20 0f       	movw   $0xf20,(%eax)
  100665:	83 c0 04             	add    $0x4,%eax
  100668:	66 c7 40 fe 20 0f    	movw   $0xf20,-0x2(%eax)
  10066e:	39 d0                	cmp    %edx,%eax
  100670:	75 ee                	jne    100660 <clr+0x40>
  100672:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  100678:	39 ca                	cmp    %ecx,%edx
  10067a:	75 c4                	jne    100640 <clr+0x20>
  10067c:	31 c0                	xor    %eax,%eax
  10067e:	31 d2                	xor    %edx,%edx
  100680:	31 c9                	xor    %ecx,%ecx
  100682:	66 a3 7c 5f 11 00    	mov    %ax,0x115f7c
  100688:	66 89 15 7a 5f 11 00 	mov    %dx,0x115f7a
  10068f:	66 89 0d 78 5f 11 00 	mov    %cx,0x115f78
  100696:	c3                   	ret
  100697:	90                   	nop
  100698:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10069f:	00 

001006a0 <get_char>:
  1006a0:	8b 44 24 08          	mov    0x8(%esp),%eax
  1006a4:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1006a7:	c1 e0 04             	shl    $0x4,%eax
  1006aa:	03 44 24 04          	add    0x4(%esp),%eax
  1006ae:	0f b6 84 00 00 80 0b 	movzbl 0xb8000(%eax,%eax,1),%eax
  1006b5:	00 
  1006b6:	c3                   	ret
  1006b7:	90                   	nop
  1006b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1006bf:	00 

001006c0 <get_color>:
  1006c0:	8b 44 24 08          	mov    0x8(%esp),%eax
  1006c4:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1006c7:	c1 e0 04             	shl    $0x4,%eax
  1006ca:	03 44 24 04          	add    0x4(%esp),%eax
  1006ce:	0f b6 84 00 01 80 0b 	movzbl 0xb8001(%eax,%eax,1),%eax
  1006d5:	00 
  1006d6:	c3                   	ret
  1006d7:	90                   	nop
  1006d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1006df:	00 

001006e0 <cmpstr>:
  1006e0:	53                   	push   %ebx
  1006e1:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  1006e5:	8b 54 24 0c          	mov    0xc(%esp),%edx
  1006e9:	0f b6 01             	movzbl (%ecx),%eax
  1006ec:	84 c0                	test   %al,%al
  1006ee:	75 1a                	jne    10070a <cmpstr+0x2a>
  1006f0:	eb 26                	jmp    100718 <cmpstr+0x38>
  1006f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1006f8:	38 c3                	cmp    %al,%bl
  1006fa:	75 15                	jne    100711 <cmpstr+0x31>
  1006fc:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
  100700:	83 c1 01             	add    $0x1,%ecx
  100703:	83 c2 01             	add    $0x1,%edx
  100706:	84 c0                	test   %al,%al
  100708:	74 0e                	je     100718 <cmpstr+0x38>
  10070a:	0f b6 1a             	movzbl (%edx),%ebx
  10070d:	84 db                	test   %bl,%bl
  10070f:	75 e7                	jne    1006f8 <cmpstr+0x18>
  100711:	31 c0                	xor    %eax,%eax
  100713:	5b                   	pop    %ebx
  100714:	c3                   	ret
  100715:	8d 76 00             	lea    0x0(%esi),%esi
  100718:	31 c0                	xor    %eax,%eax
  10071a:	80 3a 00             	cmpb   $0x0,(%edx)
  10071d:	5b                   	pop    %ebx
  10071e:	0f 94 c0             	sete   %al
  100721:	c3                   	ret
  100722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100728:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10072f:	00 

00100730 <strlen>:
  100730:	8b 54 24 04          	mov    0x4(%esp),%edx
  100734:	31 c0                	xor    %eax,%eax
  100736:	80 3a 00             	cmpb   $0x0,(%edx)
  100739:	74 15                	je     100750 <strlen+0x20>
  10073b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  100740:	83 c0 01             	add    $0x1,%eax
  100743:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  100747:	75 f7                	jne    100740 <strlen+0x10>
  100749:	c3                   	ret
  10074a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  100750:	c3                   	ret
  100751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100758:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10075f:	00 

00100760 <strcat>:
  100760:	56                   	push   %esi
  100761:	53                   	push   %ebx
  100762:	8b 74 24 10          	mov    0x10(%esp),%esi
  100766:	8b 54 24 0c          	mov    0xc(%esp),%edx
  10076a:	0f b6 1e             	movzbl (%esi),%ebx
  10076d:	84 db                	test   %bl,%bl
  10076f:	74 3c                	je     1007ad <strcat+0x4d>
  100771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100778:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10077f:	00 
  100780:	31 c0                	xor    %eax,%eax
  100782:	80 3a 00             	cmpb   $0x0,(%edx)
  100785:	74 29                	je     1007b0 <strcat+0x50>
  100787:	90                   	nop
  100788:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10078f:	00 
  100790:	89 c1                	mov    %eax,%ecx
  100792:	83 c0 01             	add    $0x1,%eax
  100795:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  100799:	75 f5                	jne    100790 <strcat+0x30>
  10079b:	01 d0                	add    %edx,%eax
  10079d:	83 c1 02             	add    $0x2,%ecx
  1007a0:	88 18                	mov    %bl,(%eax)
  1007a2:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
  1007a6:	0f b6 1e             	movzbl (%esi),%ebx
  1007a9:	84 db                	test   %bl,%bl
  1007ab:	75 d3                	jne    100780 <strcat+0x20>
  1007ad:	5b                   	pop    %ebx
  1007ae:	5e                   	pop    %esi
  1007af:	c3                   	ret
  1007b0:	89 d0                	mov    %edx,%eax
  1007b2:	b9 01 00 00 00       	mov    $0x1,%ecx
  1007b7:	eb e7                	jmp    1007a0 <strcat+0x40>
  1007b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001007c0 <split>:
  1007c0:	57                   	push   %edi
  1007c1:	56                   	push   %esi
  1007c2:	53                   	push   %ebx
  1007c3:	8b 44 24 10          	mov    0x10(%esp),%eax
  1007c7:	31 db                	xor    %ebx,%ebx
  1007c9:	0f b6 4c 24 14       	movzbl 0x14(%esp),%ecx
  1007ce:	8b 7c 24 18          	mov    0x18(%esp),%edi
  1007d2:	8b 74 24 1c          	mov    0x1c(%esp),%esi
  1007d6:	80 38 00             	cmpb   $0x0,(%eax)
  1007d9:	74 42                	je     10081d <split+0x5d>
  1007db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1007e0:	39 de                	cmp    %ebx,%esi
  1007e2:	7e 39                	jle    10081d <split+0x5d>
  1007e4:	83 c3 01             	add    $0x1,%ebx
  1007e7:	89 44 9f fc          	mov    %eax,-0x4(%edi,%ebx,4)
  1007eb:	0f b6 10             	movzbl (%eax),%edx
  1007ee:	84 d2                	test   %dl,%dl
  1007f0:	75 19                	jne    10080b <split+0x4b>
  1007f2:	eb 34                	jmp    100828 <split+0x68>
  1007f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1007f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1007ff:	00 
  100800:	0f b6 50 01          	movzbl 0x1(%eax),%edx
  100804:	83 c0 01             	add    $0x1,%eax
  100807:	84 d2                	test   %dl,%dl
  100809:	74 1d                	je     100828 <split+0x68>
  10080b:	38 d1                	cmp    %dl,%cl
  10080d:	75 f1                	jne    100800 <split+0x40>
  10080f:	89 c2                	mov    %eax,%edx
  100811:	c6 00 00             	movb   $0x0,(%eax)
  100814:	83 c0 01             	add    $0x1,%eax
  100817:	80 7a 01 00          	cmpb   $0x0,0x1(%edx)
  10081b:	75 c3                	jne    1007e0 <split+0x20>
  10081d:	89 d8                	mov    %ebx,%eax
  10081f:	5b                   	pop    %ebx
  100820:	5e                   	pop    %esi
  100821:	5f                   	pop    %edi
  100822:	c3                   	ret
  100823:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  100828:	84 c9                	test   %cl,%cl
  10082a:	75 f1                	jne    10081d <split+0x5d>
  10082c:	89 c2                	mov    %eax,%edx
  10082e:	c6 00 00             	movb   $0x0,(%eax)
  100831:	83 c0 01             	add    $0x1,%eax
  100834:	80 7a 01 00          	cmpb   $0x0,0x1(%edx)
  100838:	75 a6                	jne    1007e0 <split+0x20>
  10083a:	eb e1                	jmp    10081d <split+0x5d>
  10083c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00100840 <strcpy>:
  100840:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  100844:	8b 44 24 04          	mov    0x4(%esp),%eax
  100848:	0f b6 11             	movzbl (%ecx),%edx
  10084b:	84 d2                	test   %dl,%dl
  10084d:	74 10                	je     10085f <strcpy+0x1f>
  10084f:	90                   	nop
  100850:	83 c1 01             	add    $0x1,%ecx
  100853:	88 10                	mov    %dl,(%eax)
  100855:	83 c0 01             	add    $0x1,%eax
  100858:	0f b6 11             	movzbl (%ecx),%edx
  10085b:	84 d2                	test   %dl,%dl
  10085d:	75 f1                	jne    100850 <strcpy+0x10>
  10085f:	c6 00 00             	movb   $0x0,(%eax)
  100862:	c3                   	ret
  100863:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  100868:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10086f:	00 

00100870 <keyboard_has_data>:
  100870:	e4 64                	in     $0x64,%al
  100872:	83 e0 21             	and    $0x21,%eax
  100875:	3c 01                	cmp    $0x1,%al
  100877:	0f 94 c0             	sete   %al
  10087a:	0f b6 c0             	movzbl %al,%eax
  10087d:	c3                   	ret
  10087e:	66 90                	xchg   %ax,%ax

00100880 <read_scancode>:
  100880:	e4 60                	in     $0x60,%al
  100882:	c3                   	ret
  100883:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  100888:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10088f:	00 

00100890 <keyboard_getchar>:
  100890:	e4 64                	in     $0x64,%al
  100892:	83 e0 21             	and    $0x21,%eax
  100895:	3c 01                	cmp    $0x1,%al
  100897:	74 07                	je     1008a0 <keyboard_getchar+0x10>
  100899:	31 c0                	xor    %eax,%eax
  10089b:	c3                   	ret
  10089c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1008a0:	e4 60                	in     $0x60,%al
  1008a2:	84 c0                	test   %al,%al
  1008a4:	78 f3                	js     100899 <keyboard_getchar+0x9>
  1008a6:	0f b6 c0             	movzbl %al,%eax
  1008a9:	0f b6 80 e0 2e 10 00 	movzbl 0x102ee0(%eax),%eax
  1008b0:	c3                   	ret
  1008b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1008b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1008bf:	00 

001008c0 <kb_input>:
  1008c0:	57                   	push   %edi
  1008c1:	56                   	push   %esi
  1008c2:	53                   	push   %ebx
  1008c3:	8b 74 24 10          	mov    0x10(%esp),%esi
  1008c7:	90                   	nop
  1008c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1008cf:	00 
  1008d0:	80 3e 00             	cmpb   $0x0,(%esi)
  1008d3:	0f 84 87 00 00 00    	je     100960 <kb_input+0xa0>
  1008d9:	31 db                	xor    %ebx,%ebx
  1008db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1008e0:	83 c3 01             	add    $0x1,%ebx
  1008e3:	89 da                	mov    %ebx,%edx
  1008e5:	80 3c 1e 00          	cmpb   $0x0,(%esi,%ebx,1)
  1008e9:	75 f5                	jne    1008e0 <kb_input+0x20>
  1008eb:	e4 64                	in     $0x64,%al
  1008ed:	83 e0 21             	and    $0x21,%eax
  1008f0:	3c 01                	cmp    $0x1,%al
  1008f2:	75 dc                	jne    1008d0 <kb_input+0x10>
  1008f4:	e4 64                	in     $0x64,%al
  1008f6:	a8 01                	test   $0x1,%al
  1008f8:	74 d6                	je     1008d0 <kb_input+0x10>
  1008fa:	a8 20                	test   $0x20,%al
  1008fc:	75 d2                	jne    1008d0 <kb_input+0x10>
  1008fe:	e4 60                	in     $0x60,%al
  100900:	84 c0                	test   %al,%al
  100902:	78 cc                	js     1008d0 <kb_input+0x10>
  100904:	0f b6 c0             	movzbl %al,%eax
  100907:	0f b6 b8 e0 2e 10 00 	movzbl 0x102ee0(%eax),%edi
  10090e:	89 f8                	mov    %edi,%eax
  100910:	3c 08                	cmp    $0x8,%al
  100912:	75 52                	jne    100966 <kb_input+0xa6>
  100914:	85 db                	test   %ebx,%ebx
  100916:	74 05                	je     10091d <kb_input+0x5d>
  100918:	c6 44 16 ff 00       	movb   $0x0,-0x1(%esi,%edx,1)
  10091d:	0f b7 05 7a 5f 11 00 	movzwl 0x115f7a,%eax
  100924:	ba 01 00 00 00       	mov    $0x1,%edx
  100929:	66 83 e8 01          	sub    $0x1,%ax
  10092d:	74 09                	je     100938 <kb_input+0x78>
  10092f:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  100935:	0f b7 d0             	movzwl %ax,%edx
  100938:	0f b7 05 78 5f 11 00 	movzwl 0x115f78,%eax
  10093f:	b9 2f 00 00 00       	mov    $0x2f,%ecx
  100944:	8d 04 80             	lea    (%eax,%eax,4),%eax
  100947:	c1 e0 04             	shl    $0x4,%eax
  10094a:	01 d0                	add    %edx,%eax
  10094c:	8b 15 60 2f 10 00    	mov    0x102f60,%edx
  100952:	66 89 0c 42          	mov    %cx,(%edx,%eax,2)
  100956:	80 3e 00             	cmpb   $0x0,(%esi)
  100959:	0f 85 7a ff ff ff    	jne    1008d9 <kb_input+0x19>
  10095f:	90                   	nop
  100960:	31 d2                	xor    %edx,%edx
  100962:	31 db                	xor    %ebx,%ebx
  100964:	eb 85                	jmp    1008eb <kb_input+0x2b>
  100966:	3c 0a                	cmp    $0xa,%al
  100968:	74 2d                	je     100997 <kb_input+0xd7>
  10096a:	84 c0                	test   %al,%al
  10096c:	0f 84 5e ff ff ff    	je     1008d0 <kb_input+0x10>
  100972:	0f be c0             	movsbl %al,%eax
  100975:	6a 0f                	push   $0xf
  100977:	50                   	push   %eax
  100978:	e8 e3 f7 ff ff       	call   100160 <printc>
  10097d:	58                   	pop    %eax
  10097e:	5a                   	pop    %edx
  10097f:	80 3e 00             	cmpb   $0x0,(%esi)
  100982:	74 17                	je     10099b <kb_input+0xdb>
  100984:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
  100987:	83 c3 01             	add    $0x1,%ebx
  10098a:	89 f9                	mov    %edi,%ecx
  10098c:	88 08                	mov    %cl,(%eax)
  10098e:	c6 04 1e 00          	movb   $0x0,(%esi,%ebx,1)
  100992:	e9 39 ff ff ff       	jmp    1008d0 <kb_input+0x10>
  100997:	5b                   	pop    %ebx
  100998:	5e                   	pop    %esi
  100999:	5f                   	pop    %edi
  10099a:	c3                   	ret
  10099b:	89 f0                	mov    %esi,%eax
  10099d:	bb 01 00 00 00       	mov    $0x1,%ebx
  1009a2:	eb e6                	jmp    10098a <kb_input+0xca>
  1009a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1009a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1009af:	00 

001009b0 <app_hello_name>:
  1009b0:	53                   	push   %ebx
  1009b1:	b8 48 00 00 00       	mov    $0x48,%eax
  1009b6:	bb 7c 20 10 00       	mov    $0x10207c,%ebx
  1009bb:	83 ec 70             	sub    $0x70,%esp
  1009be:	66 90                	xchg   %ax,%ax
  1009c0:	6a 0f                	push   $0xf
  1009c2:	83 c3 01             	add    $0x1,%ebx
  1009c5:	50                   	push   %eax
  1009c6:	e8 95 f7 ff ff       	call   100160 <printc>
  1009cb:	59                   	pop    %ecx
  1009cc:	0f be 03             	movsbl (%ebx),%eax
  1009cf:	5a                   	pop    %edx
  1009d0:	81 fb a6 20 10 00    	cmp    $0x1020a6,%ebx
  1009d6:	75 e8                	jne    1009c0 <app_hello_name+0x10>
  1009d8:	8d 5c 24 0c          	lea    0xc(%esp),%ebx
  1009dc:	53                   	push   %ebx
  1009dd:	e8 de fe ff ff       	call   1008c0 <kb_input>
  1009e2:	31 c0                	xor    %eax,%eax
  1009e4:	66 83 05 78 5f 11 00 	addw   $0x1,0x115f78
  1009eb:	01 
  1009ec:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  1009f2:	0f be 44 24 10       	movsbl 0x10(%esp),%eax
  1009f7:	5a                   	pop    %edx
  1009f8:	84 c0                	test   %al,%al
  1009fa:	74 18                	je     100a14 <app_hello_name+0x64>
  1009fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100a00:	6a 0f                	push   $0xf
  100a02:	83 c3 01             	add    $0x1,%ebx
  100a05:	50                   	push   %eax
  100a06:	e8 55 f7 ff ff       	call   100160 <printc>
  100a0b:	0f be 03             	movsbl (%ebx),%eax
  100a0e:	5a                   	pop    %edx
  100a0f:	59                   	pop    %ecx
  100a10:	84 c0                	test   %al,%al
  100a12:	75 ec                	jne    100a00 <app_hello_name+0x50>
  100a14:	c7 44 24 7c 0f 00 00 	movl   $0xf,0x7c(%esp)
  100a1b:	00 
  100a1c:	c7 44 24 78 3b 1f 10 	movl   $0x101f3b,0x78(%esp)
  100a23:	00 
  100a24:	83 c4 70             	add    $0x70,%esp
  100a27:	5b                   	pop    %ebx
  100a28:	e9 a3 f7 ff ff       	jmp    1001d0 <print>
  100a2d:	8d 76 00             	lea    0x0(%esi),%esi

00100a30 <mouse_wait>:
  100a30:	8b 44 24 04          	mov    0x4(%esp),%eax
  100a34:	ba a0 86 01 00       	mov    $0x186a0,%edx
  100a39:	85 c0                	test   %eax,%eax
  100a3b:	74 08                	je     100a45 <mouse_wait+0x15>
  100a3d:	eb 16                	jmp    100a55 <mouse_wait+0x25>
  100a3f:	90                   	nop
  100a40:	83 ea 01             	sub    $0x1,%edx
  100a43:	74 1b                	je     100a60 <mouse_wait+0x30>
  100a45:	e4 64                	in     $0x64,%al
  100a47:	a8 02                	test   $0x2,%al
  100a49:	75 f5                	jne    100a40 <mouse_wait+0x10>
  100a4b:	c3                   	ret
  100a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100a50:	83 ea 01             	sub    $0x1,%edx
  100a53:	74 06                	je     100a5b <mouse_wait+0x2b>
  100a55:	e4 64                	in     $0x64,%al
  100a57:	a8 01                	test   $0x1,%al
  100a59:	74 f5                	je     100a50 <mouse_wait+0x20>
  100a5b:	c3                   	ret
  100a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100a60:	c3                   	ret
  100a61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100a68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100a6f:	00 

00100a70 <mouse_write>:
  100a70:	ba a0 86 01 00       	mov    $0x186a0,%edx
  100a75:	eb 0e                	jmp    100a85 <mouse_write+0x15>
  100a77:	90                   	nop
  100a78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100a7f:	00 
  100a80:	83 ea 01             	sub    $0x1,%edx
  100a83:	74 06                	je     100a8b <mouse_write+0x1b>
  100a85:	e4 64                	in     $0x64,%al
  100a87:	a8 02                	test   $0x2,%al
  100a89:	75 f5                	jne    100a80 <mouse_write+0x10>
  100a8b:	b8 d4 ff ff ff       	mov    $0xffffffd4,%eax
  100a90:	e6 64                	out    %al,$0x64
  100a92:	ba a0 86 01 00       	mov    $0x186a0,%edx
  100a97:	eb 0c                	jmp    100aa5 <mouse_write+0x35>
  100a99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100aa0:	83 ea 01             	sub    $0x1,%edx
  100aa3:	74 06                	je     100aab <mouse_write+0x3b>
  100aa5:	e4 64                	in     $0x64,%al
  100aa7:	a8 02                	test   $0x2,%al
  100aa9:	75 f5                	jne    100aa0 <mouse_write+0x30>
  100aab:	0f b6 44 24 04       	movzbl 0x4(%esp),%eax
  100ab0:	e6 60                	out    %al,$0x60
  100ab2:	c3                   	ret
  100ab3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  100ab8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100abf:	00 

00100ac0 <mouse_read>:
  100ac0:	ba a0 86 01 00       	mov    $0x186a0,%edx
  100ac5:	eb 0e                	jmp    100ad5 <mouse_read+0x15>
  100ac7:	90                   	nop
  100ac8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100acf:	00 
  100ad0:	83 ea 01             	sub    $0x1,%edx
  100ad3:	74 06                	je     100adb <mouse_read+0x1b>
  100ad5:	e4 64                	in     $0x64,%al
  100ad7:	a8 01                	test   $0x1,%al
  100ad9:	74 f5                	je     100ad0 <mouse_read+0x10>
  100adb:	e4 60                	in     $0x60,%al
  100add:	c3                   	ret
  100ade:	66 90                	xchg   %ax,%ax

00100ae0 <mouse_init>:
  100ae0:	ba a0 86 01 00       	mov    $0x186a0,%edx
  100ae5:	eb 0e                	jmp    100af5 <mouse_init+0x15>
  100ae7:	90                   	nop
  100ae8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100aef:	00 
  100af0:	83 ea 01             	sub    $0x1,%edx
  100af3:	74 06                	je     100afb <mouse_init+0x1b>
  100af5:	e4 64                	in     $0x64,%al
  100af7:	a8 02                	test   $0x2,%al
  100af9:	75 f5                	jne    100af0 <mouse_init+0x10>
  100afb:	b8 a8 ff ff ff       	mov    $0xffffffa8,%eax
  100b00:	e6 64                	out    %al,$0x64
  100b02:	ba a0 86 01 00       	mov    $0x186a0,%edx
  100b07:	eb 0c                	jmp    100b15 <mouse_init+0x35>
  100b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100b10:	83 ea 01             	sub    $0x1,%edx
  100b13:	74 06                	je     100b1b <mouse_init+0x3b>
  100b15:	e4 64                	in     $0x64,%al
  100b17:	a8 02                	test   $0x2,%al
  100b19:	75 f5                	jne    100b10 <mouse_init+0x30>
  100b1b:	b8 20 00 00 00       	mov    $0x20,%eax
  100b20:	e6 64                	out    %al,$0x64
  100b22:	ba a0 86 01 00       	mov    $0x186a0,%edx
  100b27:	eb 0c                	jmp    100b35 <mouse_init+0x55>
  100b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100b30:	83 ea 01             	sub    $0x1,%edx
  100b33:	74 06                	je     100b3b <mouse_init+0x5b>
  100b35:	e4 64                	in     $0x64,%al
  100b37:	a8 02                	test   $0x2,%al
  100b39:	75 f5                	jne    100b30 <mouse_init+0x50>
  100b3b:	e4 60                	in     $0x60,%al
  100b3d:	83 c8 02             	or     $0x2,%eax
  100b40:	ba a0 86 01 00       	mov    $0x186a0,%edx
  100b45:	89 c1                	mov    %eax,%ecx
  100b47:	eb 0c                	jmp    100b55 <mouse_init+0x75>
  100b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100b50:	83 ea 01             	sub    $0x1,%edx
  100b53:	74 06                	je     100b5b <mouse_init+0x7b>
  100b55:	e4 64                	in     $0x64,%al
  100b57:	a8 02                	test   $0x2,%al
  100b59:	75 f5                	jne    100b50 <mouse_init+0x70>
  100b5b:	b8 60 00 00 00       	mov    $0x60,%eax
  100b60:	e6 64                	out    %al,$0x64
  100b62:	ba a0 86 01 00       	mov    $0x186a0,%edx
  100b67:	eb 0c                	jmp    100b75 <mouse_init+0x95>
  100b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100b70:	83 ea 01             	sub    $0x1,%edx
  100b73:	74 06                	je     100b7b <mouse_init+0x9b>
  100b75:	e4 64                	in     $0x64,%al
  100b77:	a8 02                	test   $0x2,%al
  100b79:	75 f5                	jne    100b70 <mouse_init+0x90>
  100b7b:	89 c8                	mov    %ecx,%eax
  100b7d:	e6 60                	out    %al,$0x60
  100b7f:	ba a0 86 01 00       	mov    $0x186a0,%edx
  100b84:	eb 0f                	jmp    100b95 <mouse_init+0xb5>
  100b86:	66 90                	xchg   %ax,%ax
  100b88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100b8f:	00 
  100b90:	83 ea 01             	sub    $0x1,%edx
  100b93:	74 06                	je     100b9b <mouse_init+0xbb>
  100b95:	e4 64                	in     $0x64,%al
  100b97:	a8 02                	test   $0x2,%al
  100b99:	75 f5                	jne    100b90 <mouse_init+0xb0>
  100b9b:	b8 d4 ff ff ff       	mov    $0xffffffd4,%eax
  100ba0:	e6 64                	out    %al,$0x64
  100ba2:	ba a0 86 01 00       	mov    $0x186a0,%edx
  100ba7:	eb 0c                	jmp    100bb5 <mouse_init+0xd5>
  100ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100bb0:	83 ea 01             	sub    $0x1,%edx
  100bb3:	74 06                	je     100bbb <mouse_init+0xdb>
  100bb5:	e4 64                	in     $0x64,%al
  100bb7:	a8 02                	test   $0x2,%al
  100bb9:	75 f5                	jne    100bb0 <mouse_init+0xd0>
  100bbb:	b8 f6 ff ff ff       	mov    $0xfffffff6,%eax
  100bc0:	e6 60                	out    %al,$0x60
  100bc2:	ba a0 86 01 00       	mov    $0x186a0,%edx
  100bc7:	eb 0c                	jmp    100bd5 <mouse_init+0xf5>
  100bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100bd0:	83 ea 01             	sub    $0x1,%edx
  100bd3:	74 06                	je     100bdb <mouse_init+0xfb>
  100bd5:	e4 64                	in     $0x64,%al
  100bd7:	a8 01                	test   $0x1,%al
  100bd9:	74 f5                	je     100bd0 <mouse_init+0xf0>
  100bdb:	e4 60                	in     $0x60,%al
  100bdd:	ba a0 86 01 00       	mov    $0x186a0,%edx
  100be2:	eb 09                	jmp    100bed <mouse_init+0x10d>
  100be4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100be8:	83 ea 01             	sub    $0x1,%edx
  100beb:	74 06                	je     100bf3 <mouse_init+0x113>
  100bed:	e4 64                	in     $0x64,%al
  100bef:	a8 02                	test   $0x2,%al
  100bf1:	75 f5                	jne    100be8 <mouse_init+0x108>
  100bf3:	b8 d4 ff ff ff       	mov    $0xffffffd4,%eax
  100bf8:	e6 64                	out    %al,$0x64
  100bfa:	ba a0 86 01 00       	mov    $0x186a0,%edx
  100bff:	eb 0c                	jmp    100c0d <mouse_init+0x12d>
  100c01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100c08:	83 ea 01             	sub    $0x1,%edx
  100c0b:	74 06                	je     100c13 <mouse_init+0x133>
  100c0d:	e4 64                	in     $0x64,%al
  100c0f:	a8 02                	test   $0x2,%al
  100c11:	75 f5                	jne    100c08 <mouse_init+0x128>
  100c13:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  100c18:	e6 60                	out    %al,$0x60
  100c1a:	ba a0 86 01 00       	mov    $0x186a0,%edx
  100c1f:	eb 0c                	jmp    100c2d <mouse_init+0x14d>
  100c21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100c28:	83 ea 01             	sub    $0x1,%edx
  100c2b:	74 06                	je     100c33 <mouse_init+0x153>
  100c2d:	e4 64                	in     $0x64,%al
  100c2f:	a8 01                	test   $0x1,%al
  100c31:	74 f5                	je     100c28 <mouse_init+0x148>
  100c33:	e4 60                	in     $0x60,%al
  100c35:	c3                   	ret
  100c36:	66 90                	xchg   %ax,%ax
  100c38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100c3f:	00 

00100c40 <mouse_handler>:
  100c40:	e4 60                	in     $0x60,%al
  100c42:	8b 0d 70 5f 11 00    	mov    0x115f70,%ecx
  100c48:	8d 51 01             	lea    0x1(%ecx),%edx
  100c4b:	88 81 74 5f 11 00    	mov    %al,0x115f74(%ecx)
  100c51:	89 15 70 5f 11 00    	mov    %edx,0x115f70
  100c57:	83 fa 03             	cmp    $0x3,%edx
  100c5a:	74 04                	je     100c60 <mouse_handler+0x20>
  100c5c:	c3                   	ret
  100c5d:	8d 76 00             	lea    0x0(%esi),%esi
  100c60:	55                   	push   %ebp
  100c61:	57                   	push   %edi
  100c62:	56                   	push   %esi
  100c63:	53                   	push   %ebx
  100c64:	83 ec 04             	sub    $0x4,%esp
  100c67:	0f b6 05 74 5f 11 00 	movzbl 0x115f74,%eax
  100c6e:	8b 1d d8 2e 10 00    	mov    0x102ed8,%ebx
  100c74:	66 0f be 3d 65 5f 11 	movsbw 0x115f65,%di
  100c7b:	00 
  100c7c:	8b 35 dc 2e 10 00    	mov    0x102edc,%esi
  100c82:	88 44 24 03          	mov    %al,0x3(%esp)
  100c86:	0f b6 05 64 5f 11 00 	movzbl 0x115f64,%eax
  100c8d:	8d 14 9b             	lea    (%ebx,%ebx,4),%edx
  100c90:	c1 e2 04             	shl    $0x4,%edx
  100c93:	0f be 2d 75 5f 11 00 	movsbl 0x115f75,%ebp
  100c9a:	0f be 0d 76 5f 11 00 	movsbl 0x115f76,%ecx
  100ca1:	c1 e0 08             	shl    $0x8,%eax
  100ca4:	01 f2                	add    %esi,%edx
  100ca6:	09 f8                	or     %edi,%eax
  100ca8:	8b 3d 60 2f 10 00    	mov    0x102f60,%edi
  100cae:	66 89 04 57          	mov    %ax,(%edi,%edx,2)
  100cb2:	31 c0                	xor    %eax,%eax
  100cb4:	f6 44 24 03 01       	testb  $0x1,0x3(%esp)
  100cb9:	0f 85 a1 00 00 00    	jne    100d60 <mouse_handler+0x120>
  100cbf:	a3 6c 5f 11 00       	mov    %eax,0x115f6c
  100cc4:	b8 67 66 66 66       	mov    $0x66666667,%eax
  100cc9:	f7 ed                	imul   %ebp
  100ccb:	89 e8                	mov    %ebp,%eax
  100ccd:	c1 f8 1f             	sar    $0x1f,%eax
  100cd0:	d1 fa                	sar    $1,%edx
  100cd2:	29 c2                	sub    %eax,%edx
  100cd4:	b8 67 66 66 66       	mov    $0x66666667,%eax
  100cd9:	01 d6                	add    %edx,%esi
  100cdb:	f7 e9                	imul   %ecx
  100cdd:	c1 f9 1f             	sar    $0x1f,%ecx
  100ce0:	89 35 dc 2e 10 00    	mov    %esi,0x102edc
  100ce6:	d1 fa                	sar    $1,%edx
  100ce8:	29 d1                	sub    %edx,%ecx
  100cea:	01 d9                	add    %ebx,%ecx
  100cec:	89 0d d8 2e 10 00    	mov    %ecx,0x102ed8
  100cf2:	85 f6                	test   %esi,%esi
  100cf4:	0f 88 b6 00 00 00    	js     100db0 <mouse_handler+0x170>
  100cfa:	85 c9                	test   %ecx,%ecx
  100cfc:	0f 88 7e 00 00 00    	js     100d80 <mouse_handler+0x140>
  100d02:	83 fe 4f             	cmp    $0x4f,%esi
  100d05:	7e 0a                	jle    100d11 <mouse_handler+0xd1>
  100d07:	c7 05 dc 2e 10 00 4f 	movl   $0x4f,0x102edc
  100d0e:	00 00 00 
  100d11:	83 f9 18             	cmp    $0x18,%ecx
  100d14:	0f 8e 81 00 00 00    	jle    100d9b <mouse_handler+0x15b>
  100d1a:	c7 05 d8 2e 10 00 18 	movl   $0x18,0x102ed8
  100d21:	00 00 00 
  100d24:	8b 35 dc 2e 10 00    	mov    0x102edc,%esi
  100d2a:	b8 80 07 00 00       	mov    $0x780,%eax
  100d2f:	01 c6                	add    %eax,%esi
  100d31:	01 f6                	add    %esi,%esi
  100d33:	0f b6 86 00 80 0b 00 	movzbl 0xb8000(%esi),%eax
  100d3a:	a2 65 5f 11 00       	mov    %al,0x115f65
  100d3f:	0f b6 86 01 80 0b 00 	movzbl 0xb8001(%esi),%eax
  100d46:	c7 05 70 5f 11 00 00 	movl   $0x0,0x115f70
  100d4d:	00 00 00 
  100d50:	a2 64 5f 11 00       	mov    %al,0x115f64
  100d55:	83 c4 04             	add    $0x4,%esp
  100d58:	5b                   	pop    %ebx
  100d59:	5e                   	pop    %esi
  100d5a:	5f                   	pop    %edi
  100d5b:	5d                   	pop    %ebp
  100d5c:	c3                   	ret
  100d5d:	8d 76 00             	lea    0x0(%esi),%esi
  100d60:	8b 15 6c 5f 11 00    	mov    0x115f6c,%edx
  100d66:	31 c0                	xor    %eax,%eax
  100d68:	85 d2                	test   %edx,%edx
  100d6a:	0f 94 c0             	sete   %al
  100d6d:	a3 68 5f 11 00       	mov    %eax,0x115f68
  100d72:	b8 01 00 00 00       	mov    $0x1,%eax
  100d77:	e9 43 ff ff ff       	jmp    100cbf <mouse_handler+0x7f>
  100d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100d80:	c7 05 d8 2e 10 00 00 	movl   $0x0,0x102ed8
  100d87:	00 00 00 
  100d8a:	83 fe 4f             	cmp    $0x4f,%esi
  100d8d:	7e 49                	jle    100dd8 <mouse_handler+0x198>
  100d8f:	c7 05 dc 2e 10 00 4f 	movl   $0x4f,0x102edc
  100d96:	00 00 00 
  100d99:	31 c9                	xor    %ecx,%ecx
  100d9b:	8d 04 89             	lea    (%ecx,%ecx,4),%eax
  100d9e:	8b 35 dc 2e 10 00    	mov    0x102edc,%esi
  100da4:	c1 e0 04             	shl    $0x4,%eax
  100da7:	eb 86                	jmp    100d2f <mouse_handler+0xef>
  100da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  100db0:	c7 05 dc 2e 10 00 00 	movl   $0x0,0x102edc
  100db7:	00 00 00 
  100dba:	85 c9                	test   %ecx,%ecx
  100dbc:	0f 89 4f ff ff ff    	jns    100d11 <mouse_handler+0xd1>
  100dc2:	c7 05 d8 2e 10 00 00 	movl   $0x0,0x102ed8
  100dc9:	00 00 00 
  100dcc:	31 c0                	xor    %eax,%eax
  100dce:	31 f6                	xor    %esi,%esi
  100dd0:	e9 5a ff ff ff       	jmp    100d2f <mouse_handler+0xef>
  100dd5:	8d 76 00             	lea    0x0(%esi),%esi
  100dd8:	31 c0                	xor    %eax,%eax
  100dda:	e9 50 ff ff ff       	jmp    100d2f <mouse_handler+0xef>
  100ddf:	90                   	nop

00100de0 <rand>:
  100de0:	69 05 d4 2e 10 00 0d 	imul   $0x19660d,0x102ed4,%eax
  100de7:	66 19 00 
  100dea:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
  100def:	a3 d4 2e 10 00       	mov    %eax,0x102ed4
  100df4:	c3                   	ret
  100df5:	8d 76 00             	lea    0x0(%esi),%esi
  100df8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100dff:	00 

00100e00 <rand_range>:
  100e00:	69 05 d4 2e 10 00 0d 	imul   $0x19660d,0x102ed4,%eax
  100e07:	66 19 00 
  100e0a:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  100e0e:	31 d2                	xor    %edx,%edx
  100e10:	2b 4c 24 04          	sub    0x4(%esp),%ecx
  100e14:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
  100e19:	a3 d4 2e 10 00       	mov    %eax,0x102ed4
  100e1e:	f7 f1                	div    %ecx
  100e20:	8b 44 24 04          	mov    0x4(%esp),%eax
  100e24:	01 d0                	add    %edx,%eax
  100e26:	c3                   	ret
  100e27:	90                   	nop
  100e28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100e2f:	00 

00100e30 <create_window>:
  100e30:	57                   	push   %edi
  100e31:	8b 0d fc 2f 11 00    	mov    0x112ffc,%ecx
  100e37:	bf 50 00 00 00       	mov    $0x50,%edi
  100e3c:	31 d2                	xor    %edx,%edx
  100e3e:	56                   	push   %esi
  100e3f:	69 35 d4 2e 10 00 0d 	imul   $0x19660d,0x102ed4,%esi
  100e46:	66 19 00 
  100e49:	8d 41 01             	lea    0x1(%ecx),%eax
  100e4c:	53                   	push   %ebx
  100e4d:	2b 7c 24 10          	sub    0x10(%esp),%edi
  100e51:	a3 fc 2f 11 00       	mov    %eax,0x112ffc
  100e56:	69 c9 b0 04 00 00    	imul   $0x4b0,%ecx,%ecx
  100e5c:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  100e60:	81 c6 5f f3 6e 3c    	add    $0x3c6ef35f,%esi
  100e66:	89 f0                	mov    %esi,%eax
  100e68:	f7 f7                	div    %edi
  100e6a:	69 c6 0d 66 19 00    	imul   $0x19660d,%esi,%eax
  100e70:	be 19 00 00 00       	mov    $0x19,%esi
  100e75:	2b 74 24 14          	sub    0x14(%esp),%esi
  100e79:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
  100e7e:	a3 d4 2e 10 00       	mov    %eax,0x102ed4
  100e83:	89 91 00 30 11 00    	mov    %edx,0x113000(%ecx)
  100e89:	31 d2                	xor    %edx,%edx
  100e8b:	f7 f6                	div    %esi
  100e8d:	8b 44 24 14          	mov    0x14(%esp),%eax
  100e91:	89 81 0c 30 11 00    	mov    %eax,0x11300c(%ecx)
  100e97:	8b 44 24 10          	mov    0x10(%esp),%eax
  100e9b:	89 81 08 30 11 00    	mov    %eax,0x113008(%ecx)
  100ea1:	89 91 04 30 11 00    	mov    %edx,0x113004(%ecx)
  100ea7:	0f b6 03             	movzbl (%ebx),%eax
  100eaa:	81 c1 48 34 11 00    	add    $0x113448,%ecx
  100eb0:	84 c0                	test   %al,%al
  100eb2:	74 1b                	je     100ecf <create_window+0x9f>
  100eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  100eb8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100ebf:	00 
  100ec0:	83 c3 01             	add    $0x1,%ebx
  100ec3:	88 01                	mov    %al,(%ecx)
  100ec5:	83 c1 01             	add    $0x1,%ecx
  100ec8:	0f b6 03             	movzbl (%ebx),%eax
  100ecb:	84 c0                	test   %al,%al
  100ecd:	75 f1                	jne    100ec0 <create_window+0x90>
  100ecf:	c6 01 00             	movb   $0x0,(%ecx)
  100ed2:	5b                   	pop    %ebx
  100ed3:	5e                   	pop    %esi
  100ed4:	5f                   	pop    %edi
  100ed5:	c3                   	ret
  100ed6:	66 90                	xchg   %ax,%ax
  100ed8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100edf:	00 

00100ee0 <app_fancy_hello_world>:
  100ee0:	68 50 1f 10 00       	push   $0x101f50
  100ee5:	6a 05                	push   $0x5
  100ee7:	6a 19                	push   $0x19
  100ee9:	e8 42 ff ff ff       	call   100e30 <create_window>
  100eee:	a1 fc 2f 11 00       	mov    0x112ffc,%eax
  100ef3:	83 c4 0c             	add    $0xc,%esp
  100ef6:	f3 0f 7e 05 90 21 10 	movq   0x102190,%xmm0
  100efd:	00 
  100efe:	83 e8 01             	sub    $0x1,%eax
  100f01:	69 c0 b0 04 00 00    	imul   $0x4b0,%eax,%eax
  100f07:	8b 90 ac 34 11 00    	mov    0x1134ac(%eax),%edx
  100f0d:	8d 4a 01             	lea    0x1(%edx),%ecx
  100f10:	6b d2 6c             	imul   $0x6c,%edx,%edx
  100f13:	89 88 ac 34 11 00    	mov    %ecx,0x1134ac(%eax)
  100f19:	66 0f d6 84 10 10 30 	movq   %xmm0,0x113010(%eax,%edx,1)
  100f20:	11 00 
  100f22:	8d 8c 10 18 30 11 00 	lea    0x113018(%eax,%edx,1),%ecx
  100f29:	31 c0                	xor    %eax,%eax
  100f2b:	ba 48 00 00 00       	mov    $0x48,%edx
  100f30:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100f37:	00 
  100f38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100f3f:	00 
  100f40:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  100f43:	0f b6 90 5d 1f 10 00 	movzbl 0x101f5d(%eax),%edx
  100f4a:	83 c0 01             	add    $0x1,%eax
  100f4d:	83 f8 0c             	cmp    $0xc,%eax
  100f50:	75 ee                	jne    100f40 <app_fancy_hello_world+0x60>
  100f52:	c6 41 0c 00          	movb   $0x0,0xc(%ecx)
  100f56:	c3                   	ret
  100f57:	90                   	nop
  100f58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  100f5f:	00 

00100f60 <draw_window>:
  100f60:	55                   	push   %ebp
  100f61:	57                   	push   %edi
  100f62:	56                   	push   %esi
  100f63:	53                   	push   %ebx
  100f64:	83 ec 20             	sub    $0x20,%esp
  100f67:	8b 1d 60 2f 10 00    	mov    0x102f60,%ebx
  100f6d:	8b 44 24 34          	mov    0x34(%esp),%eax
  100f71:	8b 4c 24 34          	mov    0x34(%esp),%ecx
  100f75:	8b 28                	mov    (%eax),%ebp
  100f77:	8b 78 04             	mov    0x4(%eax),%edi
  100f7a:	8b 40 0c             	mov    0xc(%eax),%eax
  100f7d:	8b 49 08             	mov    0x8(%ecx),%ecx
  100f80:	89 3c 24             	mov    %edi,(%esp)
  100f83:	89 44 24 08          	mov    %eax,0x8(%esp)
  100f87:	8d 04 bf             	lea    (%edi,%edi,4),%eax
  100f8a:	03 7c 24 08          	add    0x8(%esp),%edi
  100f8e:	c1 e0 04             	shl    $0x4,%eax
  100f91:	8d 54 05 00          	lea    0x0(%ebp,%eax,1),%edx
  100f95:	8d 34 12             	lea    (%edx,%edx,1),%esi
  100f98:	ba 2b 8f ff ff       	mov    $0xffff8f2b,%edx
  100f9d:	66 89 14 33          	mov    %dx,(%ebx,%esi,1)
  100fa1:	89 74 24 10          	mov    %esi,0x10(%esp)
  100fa5:	8d 74 0d 00          	lea    0x0(%ebp,%ecx,1),%esi
  100fa9:	83 e9 01             	sub    $0x1,%ecx
  100fac:	8d 54 30 ff          	lea    -0x1(%eax,%esi,1),%edx
  100fb0:	89 74 24 04          	mov    %esi,0x4(%esp)
  100fb4:	be 2b 8f ff ff       	mov    $0xffff8f2b,%esi
  100fb9:	66 89 34 53          	mov    %si,(%ebx,%edx,2)
  100fbd:	8d 54 bf fb          	lea    -0x5(%edi,%edi,4),%edx
  100fc1:	c1 e2 04             	shl    $0x4,%edx
  100fc4:	89 4c 24 14          	mov    %ecx,0x14(%esp)
  100fc8:	8d 74 15 00          	lea    0x0(%ebp,%edx,1),%esi
  100fcc:	66 c7 04 73 2b 8f    	movw   $0x8f2b,(%ebx,%esi,2)
  100fd2:	8b 74 24 04          	mov    0x4(%esp),%esi
  100fd6:	8d 54 32 ff          	lea    -0x1(%edx,%esi,1),%edx
  100fda:	be 2b 8f ff ff       	mov    $0xffff8f2b,%esi
  100fdf:	66 89 34 53          	mov    %si,(%ebx,%edx,2)
  100fe3:	83 f9 01             	cmp    $0x1,%ecx
  100fe6:	0f 8e 89 02 00 00    	jle    101275 <draw_window+0x315>
  100fec:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  100ff0:	03 44 24 04          	add    0x4(%esp),%eax
  100ff4:	8d 54 0b 02          	lea    0x2(%ebx,%ecx,1),%edx
  100ff8:	8d 4c 43 fe          	lea    -0x2(%ebx,%eax,2),%ecx
  100ffc:	8b 44 24 08          	mov    0x8(%esp),%eax
  101000:	83 e8 01             	sub    $0x1,%eax
  101003:	89 44 24 0c          	mov    %eax,0xc(%esp)
  101007:	8d 04 80             	lea    (%eax,%eax,4),%eax
  10100a:	c1 e0 05             	shl    $0x5,%eax
  10100d:	8d 76 00             	lea    0x0(%esi),%esi
  101010:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  101017:	00 
  101018:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10101f:	00 
  101020:	be 2d 8f ff ff       	mov    $0xffff8f2d,%esi
  101025:	66 89 32             	mov    %si,(%edx)
  101028:	be 2d 8f ff ff       	mov    $0xffff8f2d,%esi
  10102d:	66 89 34 10          	mov    %si,(%eax,%edx,1)
  101031:	83 c2 02             	add    $0x2,%edx
  101034:	39 ca                	cmp    %ecx,%edx
  101036:	75 e8                	jne    101020 <draw_window+0xc0>
  101038:	8d 45 02             	lea    0x2(%ebp),%eax
  10103b:	0f b7 15 7a 5f 11 00 	movzwl 0x115f7a,%edx
  101042:	0f b7 0d 78 5f 11 00 	movzwl 0x115f78,%ecx
  101049:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  10104f:	0f b7 04 24          	movzwl (%esp),%eax
  101053:	66 a3 78 5f 11 00    	mov    %ax,0x115f78
  101059:	8b 44 24 34          	mov    0x34(%esp),%eax
  10105d:	0f be 80 48 04 00 00 	movsbl 0x448(%eax),%eax
  101064:	84 c0                	test   %al,%al
  101066:	74 3a                	je     1010a2 <draw_window+0x142>
  101068:	8b 74 24 34          	mov    0x34(%esp),%esi
  10106c:	66 89 54 24 1e       	mov    %dx,0x1e(%esp)
  101071:	89 5c 24 18          	mov    %ebx,0x18(%esp)
  101075:	8d 9e 48 04 00 00    	lea    0x448(%esi),%ebx
  10107b:	89 ce                	mov    %ecx,%esi
  10107d:	8d 76 00             	lea    0x0(%esi),%esi
  101080:	68 8f 00 00 00       	push   $0x8f
  101085:	83 c3 01             	add    $0x1,%ebx
  101088:	50                   	push   %eax
  101089:	e8 d2 f0 ff ff       	call   100160 <printc>
  10108e:	0f be 03             	movsbl (%ebx),%eax
  101091:	5a                   	pop    %edx
  101092:	59                   	pop    %ecx
  101093:	84 c0                	test   %al,%al
  101095:	75 e9                	jne    101080 <draw_window+0x120>
  101097:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  10109b:	0f b7 54 24 1e       	movzwl 0x1e(%esp),%edx
  1010a0:	89 f1                	mov    %esi,%ecx
  1010a2:	66 89 15 7a 5f 11 00 	mov    %dx,0x115f7a
  1010a9:	66 89 0d 78 5f 11 00 	mov    %cx,0x115f78
  1010b0:	83 7c 24 0c 01       	cmpl   $0x1,0xc(%esp)
  1010b5:	7e 43                	jle    1010fa <draw_window+0x19a>
  1010b7:	8d 14 bf             	lea    (%edi,%edi,4),%edx
  1010ba:	8b 44 24 10          	mov    0x10(%esp),%eax
  1010be:	c1 e2 04             	shl    $0x4,%edx
  1010c1:	01 ea                	add    %ebp,%edx
  1010c3:	8d 84 03 a0 00 00 00 	lea    0xa0(%ebx,%eax,1),%eax
  1010ca:	8d 8c 53 60 ff ff ff 	lea    -0xa0(%ebx,%edx,2),%ecx
  1010d1:	8b 54 24 04          	mov    0x4(%esp),%edx
  1010d5:	29 ea                	sub    %ebp,%edx
  1010d7:	8d 54 12 fe          	lea    -0x2(%edx,%edx,1),%edx
  1010db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1010e0:	be 7c 8f ff ff       	mov    $0xffff8f7c,%esi
  1010e5:	66 89 30             	mov    %si,(%eax)
  1010e8:	be 7c 8f ff ff       	mov    $0xffff8f7c,%esi
  1010ed:	66 89 34 02          	mov    %si,(%edx,%eax,1)
  1010f1:	05 a0 00 00 00       	add    $0xa0,%eax
  1010f6:	39 c8                	cmp    %ecx,%eax
  1010f8:	75 e6                	jne    1010e0 <draw_window+0x180>
  1010fa:	83 7c 24 14 01       	cmpl   $0x1,0x14(%esp)
  1010ff:	0f 8e aa 00 00 00    	jle    1011af <draw_window+0x24f>
  101105:	8b 74 24 04          	mov    0x4(%esp),%esi
  101109:	8d 4d 01             	lea    0x1(%ebp),%ecx
  10110c:	83 ee 01             	sub    $0x1,%esi
  10110f:	83 7c 24 0c 01       	cmpl   $0x1,0xc(%esp)
  101114:	0f 8e 44 01 00 00    	jle    10125e <draw_window+0x2fe>
  10111a:	8d 04 bf             	lea    (%edi,%edi,4),%eax
  10111d:	c1 e0 04             	shl    $0x4,%eax
  101120:	01 e8                	add    %ebp,%eax
  101122:	8d 94 43 62 ff ff ff 	lea    -0x9e(%ebx,%eax,2),%edx
  101129:	69 44 24 08 60 ff ff 	imul   $0xffffff60,0x8(%esp),%eax
  101130:	ff 
  101131:	8d 98 40 01 00 00    	lea    0x140(%eax),%ebx
  101137:	90                   	nop
  101138:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10113f:	00 
  101140:	89 df                	mov    %ebx,%edi
  101142:	8d 04 13             	lea    (%ebx,%edx,1),%eax
  101145:	f7 df                	neg    %edi
  101147:	83 e7 20             	and    $0x20,%edi
  10114a:	74 34                	je     101180 <draw_window+0x220>
  10114c:	bf 20 7f 00 00       	mov    $0x7f20,%edi
  101151:	05 a0 00 00 00       	add    $0xa0,%eax
  101156:	66 89 b8 60 ff ff ff 	mov    %di,-0xa0(%eax)
  10115d:	39 c2                	cmp    %eax,%edx
  10115f:	74 40                	je     1011a1 <draw_window+0x241>
  101161:	eb 1d                	jmp    101180 <draw_window+0x220>
  101163:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  101168:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10116f:	00 
  101170:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  101177:	00 
  101178:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10117f:	00 
  101180:	bf 20 7f 00 00       	mov    $0x7f20,%edi
  101185:	05 40 01 00 00       	add    $0x140,%eax
  10118a:	66 89 b8 c0 fe ff ff 	mov    %di,-0x140(%eax)
  101191:	bf 20 7f 00 00       	mov    $0x7f20,%edi
  101196:	66 89 b8 60 ff ff ff 	mov    %di,-0xa0(%eax)
  10119d:	39 c2                	cmp    %eax,%edx
  10119f:	75 df                	jne    101180 <draw_window+0x220>
  1011a1:	83 c1 01             	add    $0x1,%ecx
  1011a4:	83 c2 02             	add    $0x2,%edx
  1011a7:	39 ce                	cmp    %ecx,%esi
  1011a9:	0f 85 91 ff ff ff    	jne    101140 <draw_window+0x1e0>
  1011af:	8b 44 24 34          	mov    0x34(%esp),%eax
  1011b3:	8b 80 ac 04 00 00    	mov    0x4ac(%eax),%eax
  1011b9:	85 c0                	test   %eax,%eax
  1011bb:	0f 8e 95 00 00 00    	jle    101256 <draw_window+0x2f6>
  1011c1:	0f b7 3d 7a 5f 11 00 	movzwl 0x115f7a,%edi
  1011c8:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1011cc:	66 89 7c 24 04       	mov    %di,0x4(%esp)
  1011d1:	0f b7 3d 78 5f 11 00 	movzwl 0x115f78,%edi
  1011d8:	66 89 7c 24 08       	mov    %di,0x8(%esp)
  1011dd:	8b 7c 24 34          	mov    0x34(%esp),%edi
  1011e1:	8d 77 18             	lea    0x18(%edi),%esi
  1011e4:	31 ff                	xor    %edi,%edi
  1011e6:	66 90                	xchg   %ax,%ax
  1011e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1011ef:	00 
  1011f0:	8b 4e f8             	mov    -0x8(%esi),%ecx
  1011f3:	8b 14 24             	mov    (%esp),%edx
  1011f6:	89 f3                	mov    %esi,%ebx
  1011f8:	03 56 fc             	add    -0x4(%esi),%edx
  1011fb:	01 e9                	add    %ebp,%ecx
  1011fd:	66 89 15 78 5f 11 00 	mov    %dx,0x115f78
  101204:	66 89 0d 7a 5f 11 00 	mov    %cx,0x115f7a
  10120b:	0f be 16             	movsbl (%esi),%edx
  10120e:	84 d2                	test   %dl,%dl
  101210:	74 22                	je     101234 <draw_window+0x2d4>
  101212:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101218:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10121f:	00 
  101220:	6a 7f                	push   $0x7f
  101222:	83 c3 01             	add    $0x1,%ebx
  101225:	52                   	push   %edx
  101226:	e8 35 ef ff ff       	call   100160 <printc>
  10122b:	0f be 13             	movsbl (%ebx),%edx
  10122e:	58                   	pop    %eax
  10122f:	59                   	pop    %ecx
  101230:	84 d2                	test   %dl,%dl
  101232:	75 ec                	jne    101220 <draw_window+0x2c0>
  101234:	0f b7 44 24 04       	movzwl 0x4(%esp),%eax
  101239:	83 c7 01             	add    $0x1,%edi
  10123c:	83 c6 6c             	add    $0x6c,%esi
  10123f:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  101245:	0f b7 44 24 08       	movzwl 0x8(%esp),%eax
  10124a:	66 a3 78 5f 11 00    	mov    %ax,0x115f78
  101250:	39 7c 24 0c          	cmp    %edi,0xc(%esp)
  101254:	75 9a                	jne    1011f0 <draw_window+0x290>
  101256:	83 c4 20             	add    $0x20,%esp
  101259:	5b                   	pop    %ebx
  10125a:	5e                   	pop    %esi
  10125b:	5f                   	pop    %edi
  10125c:	5d                   	pop    %ebp
  10125d:	c3                   	ret
  10125e:	8d 41 01             	lea    0x1(%ecx),%eax
  101261:	39 c6                	cmp    %eax,%esi
  101263:	0f 84 46 ff ff ff    	je     1011af <draw_window+0x24f>
  101269:	83 c1 02             	add    $0x2,%ecx
  10126c:	39 ce                	cmp    %ecx,%esi
  10126e:	75 ee                	jne    10125e <draw_window+0x2fe>
  101270:	e9 3a ff ff ff       	jmp    1011af <draw_window+0x24f>
  101275:	8b 44 24 08          	mov    0x8(%esp),%eax
  101279:	83 e8 01             	sub    $0x1,%eax
  10127c:	89 44 24 0c          	mov    %eax,0xc(%esp)
  101280:	e9 b3 fd ff ff       	jmp    101038 <draw_window+0xd8>
  101285:	8d 76 00             	lea    0x0(%esi),%esi
  101288:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10128f:	00 

00101290 <get_window_at>:
  101290:	a1 fc 2f 11 00       	mov    0x112ffc,%eax
  101295:	56                   	push   %esi
  101296:	53                   	push   %ebx
  101297:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  10129b:	89 c1                	mov    %eax,%ecx
  10129d:	8b 74 24 10          	mov    0x10(%esp),%esi
  1012a1:	83 e9 01             	sub    $0x1,%ecx
  1012a4:	78 57                	js     1012fd <get_window_at+0x6d>
  1012a6:	69 c0 b0 04 00 00    	imul   $0x4b0,%eax,%eax
  1012ac:	05 00 30 11 00       	add    $0x113000,%eax
  1012b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1012b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1012bf:	00 
  1012c0:	8b 90 50 fb ff ff    	mov    -0x4b0(%eax),%edx
  1012c6:	39 da                	cmp    %ebx,%edx
  1012c8:	7f 26                	jg     1012f0 <get_window_at+0x60>
  1012ca:	03 90 58 fb ff ff    	add    -0x4a8(%eax),%edx
  1012d0:	39 da                	cmp    %ebx,%edx
  1012d2:	7e 1c                	jle    1012f0 <get_window_at+0x60>
  1012d4:	8b 90 54 fb ff ff    	mov    -0x4ac(%eax),%edx
  1012da:	39 f2                	cmp    %esi,%edx
  1012dc:	7f 12                	jg     1012f0 <get_window_at+0x60>
  1012de:	03 90 5c fb ff ff    	add    -0x4a4(%eax),%edx
  1012e4:	39 f2                	cmp    %esi,%edx
  1012e6:	7f 1a                	jg     101302 <get_window_at+0x72>
  1012e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1012ef:	00 
  1012f0:	83 e9 01             	sub    $0x1,%ecx
  1012f3:	2d b0 04 00 00       	sub    $0x4b0,%eax
  1012f8:	83 f9 ff             	cmp    $0xffffffff,%ecx
  1012fb:	75 c3                	jne    1012c0 <get_window_at+0x30>
  1012fd:	31 c0                	xor    %eax,%eax
  1012ff:	5b                   	pop    %ebx
  101300:	5e                   	pop    %esi
  101301:	c3                   	ret
  101302:	69 c1 b0 04 00 00    	imul   $0x4b0,%ecx,%eax
  101308:	5b                   	pop    %ebx
  101309:	5e                   	pop    %esi
  10130a:	05 00 30 11 00       	add    $0x113000,%eax
  10130f:	c3                   	ret

00101310 <find_window_index>:
  101310:	8b 0d fc 2f 11 00    	mov    0x112ffc,%ecx
  101316:	53                   	push   %ebx
  101317:	31 c0                	xor    %eax,%eax
  101319:	8b 5c 24 08          	mov    0x8(%esp),%ebx
  10131d:	85 c9                	test   %ecx,%ecx
  10131f:	7f 26                	jg     101347 <find_window_index+0x37>
  101321:	eb 3d                	jmp    101360 <find_window_index+0x50>
  101323:	eb 1b                	jmp    101340 <find_window_index+0x30>
  101325:	8d 76 00             	lea    0x0(%esi),%esi
  101328:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10132f:	00 
  101330:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  101337:	00 
  101338:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10133f:	00 
  101340:	83 c0 01             	add    $0x1,%eax
  101343:	39 c8                	cmp    %ecx,%eax
  101345:	74 19                	je     101360 <find_window_index+0x50>
  101347:	69 d0 b0 04 00 00    	imul   $0x4b0,%eax,%edx
  10134d:	81 c2 00 30 11 00    	add    $0x113000,%edx
  101353:	39 d3                	cmp    %edx,%ebx
  101355:	75 e9                	jne    101340 <find_window_index+0x30>
  101357:	5b                   	pop    %ebx
  101358:	c3                   	ret
  101359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101360:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101365:	5b                   	pop    %ebx
  101366:	c3                   	ret
  101367:	90                   	nop
  101368:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10136f:	00 

00101370 <bring_window_to_front>:
  101370:	55                   	push   %ebp
  101371:	57                   	push   %edi
  101372:	56                   	push   %esi
  101373:	53                   	push   %ebx
  101374:	81 ec bc 04 00 00    	sub    $0x4bc,%esp
  10137a:	8b ac 24 d0 04 00 00 	mov    0x4d0(%esp),%ebp
  101381:	89 e7                	mov    %esp,%edi
  101383:	83 ec 04             	sub    $0x4,%esp
  101386:	68 b0 04 00 00       	push   $0x4b0
  10138b:	69 c5 b0 04 00 00    	imul   $0x4b0,%ebp,%eax
  101391:	8d 98 00 30 11 00    	lea    0x113000(%eax),%ebx
  101397:	53                   	push   %ebx
  101398:	57                   	push   %edi
  101399:	e8 f2 03 00 00       	call   101790 <memcpy>
  10139e:	8b 15 fc 2f 11 00    	mov    0x112ffc,%edx
  1013a4:	89 fc                	mov    %edi,%esp
  1013a6:	8d 72 ff             	lea    -0x1(%edx),%esi
  1013a9:	39 f5                	cmp    %esi,%ebp
  1013ab:	7d 31                	jge    1013de <bring_window_to_front+0x6e>
  1013ad:	89 d8                	mov    %ebx,%eax
  1013af:	69 da b0 04 00 00    	imul   $0x4b0,%edx,%ebx
  1013b5:	81 c3 50 2b 11 00    	add    $0x112b50,%ebx
  1013bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1013c0:	83 ec 04             	sub    $0x4,%esp
  1013c3:	8d a8 b0 04 00 00    	lea    0x4b0(%eax),%ebp
  1013c9:	68 b0 04 00 00       	push   $0x4b0
  1013ce:	55                   	push   %ebp
  1013cf:	50                   	push   %eax
  1013d0:	e8 bb 03 00 00       	call   101790 <memcpy>
  1013d5:	89 e8                	mov    %ebp,%eax
  1013d7:	83 c4 10             	add    $0x10,%esp
  1013da:	39 dd                	cmp    %ebx,%ebp
  1013dc:	75 e2                	jne    1013c0 <bring_window_to_front+0x50>
  1013de:	69 f6 b0 04 00 00    	imul   $0x4b0,%esi,%esi
  1013e4:	83 ec 04             	sub    $0x4,%esp
  1013e7:	68 b0 04 00 00       	push   $0x4b0
  1013ec:	57                   	push   %edi
  1013ed:	81 c6 00 30 11 00    	add    $0x113000,%esi
  1013f3:	56                   	push   %esi
  1013f4:	e8 97 03 00 00       	call   101790 <memcpy>
  1013f9:	81 c4 cc 04 00 00    	add    $0x4cc,%esp
  1013ff:	5b                   	pop    %ebx
  101400:	5e                   	pop    %esi
  101401:	5f                   	pop    %edi
  101402:	5d                   	pop    %ebp
  101403:	c3                   	ret
  101404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101408:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10140f:	00 

00101410 <render_input>:
  101410:	a1 60 2f 10 00       	mov    0x102f60,%eax
  101415:	ba 3e 0b 00 00       	mov    $0xb3e,%edx
  10141a:	66 89 10             	mov    %dx,(%eax)
  10141d:	6a 00                	push   $0x0
  10141f:	6a 01                	push   $0x1
  101421:	6a 0f                	push   $0xf
  101423:	68 00 5f 11 00       	push   $0x115f00
  101428:	e8 e3 ef ff ff       	call   100410 <print_cords_local>
  10142d:	83 c4 10             	add    $0x10,%esp
  101430:	c3                   	ret
  101431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101438:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10143f:	00 

00101440 <render_windows>:
  101440:	83 ec 0c             	sub    $0xc,%esp
  101443:	89 7c 24 08          	mov    %edi,0x8(%esp)
  101447:	8b 3d fc 2f 11 00    	mov    0x112ffc,%edi
  10144d:	85 ff                	test   %edi,%edi
  10144f:	7e 2a                	jle    10147b <render_windows+0x3b>
  101451:	89 1c 24             	mov    %ebx,(%esp)
  101454:	31 db                	xor    %ebx,%ebx
  101456:	89 74 24 04          	mov    %esi,0x4(%esp)
  10145a:	be 00 30 11 00       	mov    $0x113000,%esi
  10145f:	90                   	nop
  101460:	56                   	push   %esi
  101461:	83 c3 01             	add    $0x1,%ebx
  101464:	81 c6 b0 04 00 00    	add    $0x4b0,%esi
  10146a:	e8 f1 fa ff ff       	call   100f60 <draw_window>
  10146f:	58                   	pop    %eax
  101470:	39 fb                	cmp    %edi,%ebx
  101472:	75 ec                	jne    101460 <render_windows+0x20>
  101474:	8b 1c 24             	mov    (%esp),%ebx
  101477:	8b 74 24 04          	mov    0x4(%esp),%esi
  10147b:	8b 7c 24 08          	mov    0x8(%esp),%edi
  10147f:	83 c4 0c             	add    $0xc,%esp
  101482:	c3                   	ret
  101483:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  101488:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10148f:	00 

00101490 <erease_windows>:
  101490:	83 ec 10             	sub    $0x10,%esp
  101493:	89 7c 24 08          	mov    %edi,0x8(%esp)
  101497:	8b 3d fc 2f 11 00    	mov    0x112ffc,%edi
  10149d:	85 ff                	test   %edi,%edi
  10149f:	7e 62                	jle    101503 <erease_windows+0x73>
  1014a1:	89 74 24 04          	mov    %esi,0x4(%esp)
  1014a5:	b9 00 30 11 00       	mov    $0x113000,%ecx
  1014aa:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
  1014ae:	89 1c 24             	mov    %ebx,(%esp)
  1014b1:	31 db                	xor    %ebx,%ebx
  1014b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1014b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1014bf:	00 
  1014c0:	8b 69 08             	mov    0x8(%ecx),%ebp
  1014c3:	83 fd ff             	cmp    $0xffffffff,%ebp
  1014c6:	7c 23                	jl     1014eb <erease_windows+0x5b>
  1014c8:	8b 11                	mov    (%ecx),%edx
  1014ca:	8b 71 04             	mov    0x4(%ecx),%esi
  1014cd:	8d 42 ff             	lea    -0x1(%edx),%eax
  1014d0:	01 ea                	add    %ebp,%edx
  1014d2:	8b 69 0c             	mov    0xc(%ecx),%ebp
  1014d5:	01 f5                	add    %esi,%ebp
  1014d7:	90                   	nop
  1014d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1014df:	00 
  1014e0:	39 c5                	cmp    %eax,%ebp
  1014e2:	7d 27                	jge    10150b <erease_windows+0x7b>
  1014e4:	83 c0 01             	add    $0x1,%eax
  1014e7:	39 d0                	cmp    %edx,%eax
  1014e9:	7e f5                	jle    1014e0 <erease_windows+0x50>
  1014eb:	83 c3 01             	add    $0x1,%ebx
  1014ee:	81 c1 b0 04 00 00    	add    $0x4b0,%ecx
  1014f4:	39 fb                	cmp    %edi,%ebx
  1014f6:	75 c8                	jne    1014c0 <erease_windows+0x30>
  1014f8:	8b 1c 24             	mov    (%esp),%ebx
  1014fb:	8b 74 24 04          	mov    0x4(%esp),%esi
  1014ff:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  101503:	8b 7c 24 08          	mov    0x8(%esp),%edi
  101507:	83 c4 10             	add    $0x10,%esp
  10150a:	c3                   	ret
  10150b:	6b f6 50             	imul   $0x50,%esi,%esi
  10150e:	8b 15 60 2f 10 00    	mov    0x102f60,%edx
  101514:	01 f0                	add    %esi,%eax
  101516:	01 c0                	add    %eax,%eax
  101518:	8d 84 02 60 ff ff ff 	lea    -0xa0(%edx,%eax,1),%eax
  10151f:	90                   	nop
  101520:	ba 61 0f 00 00       	mov    $0xf61,%edx
  101525:	05 a0 00 00 00       	add    $0xa0,%eax
  10152a:	66 89 90 60 ff ff ff 	mov    %dx,-0xa0(%eax)
  101531:	eb ed                	jmp    101520 <erease_windows+0x90>
  101533:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  101538:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10153f:	00 

00101540 <add_text_wdgt>:
  101540:	56                   	push   %esi
  101541:	53                   	push   %ebx
  101542:	8b 54 24 18          	mov    0x18(%esp),%edx
  101546:	8b 74 24 0c          	mov    0xc(%esp),%esi
  10154a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  10154e:	8b 82 ac 04 00 00    	mov    0x4ac(%edx),%eax
  101554:	8d 58 01             	lea    0x1(%eax),%ebx
  101557:	6b c0 6c             	imul   $0x6c,%eax,%eax
  10155a:	89 9a ac 04 00 00    	mov    %ebx,0x4ac(%edx)
  101560:	89 74 02 10          	mov    %esi,0x10(%edx,%eax,1)
  101564:	8b 74 24 10          	mov    0x10(%esp),%esi
  101568:	89 74 02 14          	mov    %esi,0x14(%edx,%eax,1)
  10156c:	8d 44 02 18          	lea    0x18(%edx,%eax,1),%eax
  101570:	0f b6 11             	movzbl (%ecx),%edx
  101573:	84 d2                	test   %dl,%dl
  101575:	74 18                	je     10158f <add_text_wdgt+0x4f>
  101577:	90                   	nop
  101578:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10157f:	00 
  101580:	83 c1 01             	add    $0x1,%ecx
  101583:	88 10                	mov    %dl,(%eax)
  101585:	83 c0 01             	add    $0x1,%eax
  101588:	0f b6 11             	movzbl (%ecx),%edx
  10158b:	84 d2                	test   %dl,%dl
  10158d:	75 f1                	jne    101580 <add_text_wdgt+0x40>
  10158f:	c6 00 00             	movb   $0x0,(%eax)
  101592:	5b                   	pop    %ebx
  101593:	5e                   	pop    %esi
  101594:	c3                   	ret
  101595:	8d 76 00             	lea    0x0(%esi),%esi
  101598:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10159f:	00 

001015a0 <drawbar>:
  1015a0:	a1 60 2f 10 00       	mov    0x102f60,%eax
  1015a5:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1015ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1015b0:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1015b7:	00 
  1015b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1015bf:	00 
  1015c0:	b9 3d 0a 00 00       	mov    $0xa3d,%ecx
  1015c5:	83 c0 04             	add    $0x4,%eax
  1015c8:	66 89 48 fc          	mov    %cx,-0x4(%eax)
  1015cc:	b9 3d 0a 00 00       	mov    $0xa3d,%ecx
  1015d1:	66 89 48 fe          	mov    %cx,-0x2(%eax)
  1015d5:	39 d0                	cmp    %edx,%eax
  1015d7:	75 e7                	jne    1015c0 <drawbar+0x20>
  1015d9:	c3                   	ret
  1015da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001015e0 <register_app>:
  1015e0:	a1 80 2f 11 00       	mov    0x112f80,%eax
  1015e5:	83 f8 09             	cmp    $0x9,%eax
  1015e8:	7f 1e                	jg     101608 <register_app+0x28>
  1015ea:	8b 54 24 04          	mov    0x4(%esp),%edx
  1015ee:	89 14 c5 a0 2f 11 00 	mov    %edx,0x112fa0(,%eax,8)
  1015f5:	8b 54 24 08          	mov    0x8(%esp),%edx
  1015f9:	89 14 c5 a4 2f 11 00 	mov    %edx,0x112fa4(,%eax,8)
  101600:	83 c0 01             	add    $0x1,%eax
  101603:	a3 80 2f 11 00       	mov    %eax,0x112f80
  101608:	c3                   	ret
  101609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00101610 <find_app>:
  101610:	83 ec 10             	sub    $0x10,%esp
  101613:	89 7c 24 08          	mov    %edi,0x8(%esp)
  101617:	8b 3d 80 2f 11 00    	mov    0x112f80,%edi
  10161d:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
  101621:	8b 6c 24 14          	mov    0x14(%esp),%ebp
  101625:	85 ff                	test   %edi,%edi
  101627:	7e 56                	jle    10167f <find_app+0x6f>
  101629:	89 1c 24             	mov    %ebx,(%esp)
  10162c:	89 74 24 04          	mov    %esi,0x4(%esp)
  101630:	31 f6                	xor    %esi,%esi
  101632:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101638:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10163f:	00 
  101640:	8b 14 f5 a0 2f 11 00 	mov    0x112fa0(,%esi,8),%edx
  101647:	89 e9                	mov    %ebp,%ecx
  101649:	0f b6 02             	movzbl (%edx),%eax
  10164c:	84 c0                	test   %al,%al
  10164e:	75 1a                	jne    10166a <find_app+0x5a>
  101650:	eb 3e                	jmp    101690 <find_app+0x80>
  101652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101658:	38 c3                	cmp    %al,%bl
  10165a:	75 15                	jne    101671 <find_app+0x61>
  10165c:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  101660:	83 c2 01             	add    $0x1,%edx
  101663:	83 c1 01             	add    $0x1,%ecx
  101666:	84 c0                	test   %al,%al
  101668:	74 26                	je     101690 <find_app+0x80>
  10166a:	0f b6 19             	movzbl (%ecx),%ebx
  10166d:	84 db                	test   %bl,%bl
  10166f:	75 e7                	jne    101658 <find_app+0x48>
  101671:	83 c6 01             	add    $0x1,%esi
  101674:	39 fe                	cmp    %edi,%esi
  101676:	75 c8                	jne    101640 <find_app+0x30>
  101678:	8b 1c 24             	mov    (%esp),%ebx
  10167b:	8b 74 24 04          	mov    0x4(%esp),%esi
  10167f:	8b 7c 24 08          	mov    0x8(%esp),%edi
  101683:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  101687:	31 c0                	xor    %eax,%eax
  101689:	83 c4 10             	add    $0x10,%esp
  10168c:	c3                   	ret
  10168d:	8d 76 00             	lea    0x0(%esi),%esi
  101690:	80 39 00             	cmpb   $0x0,(%ecx)
  101693:	75 dc                	jne    101671 <find_app+0x61>
  101695:	8d 04 f5 a0 2f 11 00 	lea    0x112fa0(,%esi,8),%eax
  10169c:	8b 1c 24             	mov    (%esp),%ebx
  10169f:	8b 74 24 04          	mov    0x4(%esp),%esi
  1016a3:	8b 7c 24 08          	mov    0x8(%esp),%edi
  1016a7:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  1016ab:	83 c4 10             	add    $0x10,%esp
  1016ae:	c3                   	ret
  1016af:	90                   	nop

001016b0 <run_app>:
  1016b0:	83 ec 2c             	sub    $0x2c,%esp
  1016b3:	8b 44 24 30          	mov    0x30(%esp),%eax
  1016b7:	8b 54 24 34          	mov    0x34(%esp),%edx
  1016bb:	85 c0                	test   %eax,%eax
  1016bd:	75 09                	jne    1016c8 <run_app+0x18>
  1016bf:	83 c4 2c             	add    $0x2c,%esp
  1016c2:	c3                   	ret
  1016c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  1016c8:	89 7c 24 24          	mov    %edi,0x24(%esp)
  1016cc:	8b 3d 80 2f 11 00    	mov    0x112f80,%edi
  1016d2:	85 ff                	test   %edi,%edi
  1016d4:	7e 5e                	jle    101734 <run_app+0x84>
  1016d6:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
  1016da:	89 44 24 08          	mov    %eax,0x8(%esp)
  1016de:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1016e2:	89 6c 24 28          	mov    %ebp,0x28(%esp)
  1016e6:	8b 2a                	mov    (%edx),%ebp
  1016e8:	89 74 24 20          	mov    %esi,0x20(%esp)
  1016ec:	31 f6                	xor    %esi,%esi
  1016ee:	66 90                	xchg   %ax,%ax
  1016f0:	8b 14 f5 a0 2f 11 00 	mov    0x112fa0(,%esi,8),%edx
  1016f7:	89 e9                	mov    %ebp,%ecx
  1016f9:	0f b6 02             	movzbl (%edx),%eax
  1016fc:	84 c0                	test   %al,%al
  1016fe:	75 1a                	jne    10171a <run_app+0x6a>
  101700:	eb 4e                	jmp    101750 <run_app+0xa0>
  101702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  101708:	38 d8                	cmp    %bl,%al
  10170a:	75 15                	jne    101721 <run_app+0x71>
  10170c:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  101710:	83 c2 01             	add    $0x1,%edx
  101713:	83 c1 01             	add    $0x1,%ecx
  101716:	84 c0                	test   %al,%al
  101718:	74 36                	je     101750 <run_app+0xa0>
  10171a:	0f b6 19             	movzbl (%ecx),%ebx
  10171d:	84 db                	test   %bl,%bl
  10171f:	75 e7                	jne    101708 <run_app+0x58>
  101721:	83 c6 01             	add    $0x1,%esi
  101724:	39 fe                	cmp    %edi,%esi
  101726:	75 c8                	jne    1016f0 <run_app+0x40>
  101728:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
  10172c:	8b 74 24 20          	mov    0x20(%esp),%esi
  101730:	8b 6c 24 28          	mov    0x28(%esp),%ebp
  101734:	8b 7c 24 24          	mov    0x24(%esp),%edi
  101738:	c7 44 24 34 0c 00 00 	movl   $0xc,0x34(%esp)
  10173f:	00 
  101740:	c7 44 24 30 69 1f 10 	movl   $0x101f69,0x30(%esp)
  101747:	00 
  101748:	83 c4 2c             	add    $0x2c,%esp
  10174b:	e9 80 ea ff ff       	jmp    1001d0 <print>
  101750:	80 39 00             	cmpb   $0x0,(%ecx)
  101753:	75 cc                	jne    101721 <run_app+0x71>
  101755:	8b 44 24 08          	mov    0x8(%esp),%eax
  101759:	8b 54 24 0c          	mov    0xc(%esp),%edx
  10175d:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
  101761:	8b 7c 24 24          	mov    0x24(%esp),%edi
  101765:	89 54 24 34          	mov    %edx,0x34(%esp)
  101769:	8b 6c 24 28          	mov    0x28(%esp),%ebp
  10176d:	89 44 24 30          	mov    %eax,0x30(%esp)
  101771:	8b 04 f5 a4 2f 11 00 	mov    0x112fa4(,%esi,8),%eax
  101778:	8b 74 24 20          	mov    0x20(%esp),%esi
  10177c:	83 c4 2c             	add    $0x2c,%esp
  10177f:	ff e0                	jmp    *%eax
  101781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101788:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10178f:	00 

00101790 <memcpy>:
  101790:	83 ec 08             	sub    $0x8,%esp
  101793:	8b 44 24 14          	mov    0x14(%esp),%eax
  101797:	8b 54 24 0c          	mov    0xc(%esp),%edx
  10179b:	89 34 24             	mov    %esi,(%esp)
  10179e:	8b 74 24 10          	mov    0x10(%esp),%esi
  1017a2:	85 c0                	test   %eax,%eax
  1017a4:	74 13                	je     1017b9 <memcpy+0x29>
  1017a6:	89 7c 24 04          	mov    %edi,0x4(%esp)
  1017aa:	01 d0                	add    %edx,%eax
  1017ac:	89 d7                	mov    %edx,%edi
  1017ae:	66 90                	xchg   %ax,%ax
  1017b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  1017b1:	39 f8                	cmp    %edi,%eax
  1017b3:	75 fb                	jne    1017b0 <memcpy+0x20>
  1017b5:	8b 7c 24 04          	mov    0x4(%esp),%edi
  1017b9:	8b 34 24             	mov    (%esp),%esi
  1017bc:	89 d0                	mov    %edx,%eax
  1017be:	83 c4 08             	add    $0x8,%esp
  1017c1:	c3                   	ret
  1017c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1017c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  1017cf:	00 

001017d0 <kernel_main>:
  1017d0:	55                   	push   %ebp
  1017d1:	ba da 03 00 00       	mov    $0x3da,%edx
  1017d6:	57                   	push   %edi
  1017d7:	56                   	push   %esi
  1017d8:	53                   	push   %ebx
  1017d9:	83 ec 3c             	sub    $0x3c,%esp
  1017dc:	ec                   	in     (%dx),%al
  1017dd:	b8 30 00 00 00       	mov    $0x30,%eax
  1017e2:	ba c0 03 00 00       	mov    $0x3c0,%edx
  1017e7:	ee                   	out    %al,(%dx)
  1017e8:	ba c1 03 00 00       	mov    $0x3c1,%edx
  1017ed:	ec                   	in     (%dx),%al
  1017ee:	ba c0 03 00 00       	mov    $0x3c0,%edx
  1017f3:	83 e0 f7             	and    $0xfffffff7,%eax
  1017f6:	ee                   	out    %al,(%dx)
  1017f7:	6a 0f                	push   $0xf
  1017f9:	68 78 1f 10 00       	push   $0x101f78
  1017fe:	e8 cd e9 ff ff       	call   1001d0 <print>
  101803:	e8 d8 f2 ff ff       	call   100ae0 <mouse_init>
  101808:	6a 0f                	push   $0xf
  10180a:	68 8a 1f 10 00       	push   $0x101f8a
  10180f:	e8 bc e9 ff ff       	call   1001d0 <print>
  101814:	a1 80 2f 11 00       	mov    0x112f80,%eax
  101819:	83 c4 10             	add    $0x10,%esp
  10181c:	83 f8 09             	cmp    $0x9,%eax
  10181f:	0f 8f 8a 00 00 00    	jg     1018af <kernel_main+0xdf>
  101825:	c7 04 c5 a0 2f 11 00 	movl   $0x101fa4,0x112fa0(,%eax,8)
  10182c:	a4 1f 10 00 
  101830:	8d 50 01             	lea    0x1(%eax),%edx
  101833:	c7 04 c5 a4 2f 11 00 	movl   $0x100280,0x112fa4(,%eax,8)
  10183a:	80 02 10 00 
  10183e:	89 15 80 2f 11 00    	mov    %edx,0x112f80
  101844:	83 fa 0a             	cmp    $0xa,%edx
  101847:	74 66                	je     1018af <kernel_main+0xdf>
  101849:	c7 04 d5 a0 2f 11 00 	movl   $0x101faf,0x112fa0(,%edx,8)
  101850:	af 1f 10 00 
  101854:	c7 04 d5 a4 2f 11 00 	movl   $0x100080,0x112fa4(,%edx,8)
  10185b:	80 00 10 00 
  10185f:	8d 50 02             	lea    0x2(%eax),%edx
  101862:	89 15 80 2f 11 00    	mov    %edx,0x112f80
  101868:	83 fa 0a             	cmp    $0xa,%edx
  10186b:	74 42                	je     1018af <kernel_main+0xdf>
  10186d:	c7 04 d5 a0 2f 11 00 	movl   $0x101fa9,0x112fa0(,%edx,8)
  101874:	a9 1f 10 00 
  101878:	c7 04 d5 a4 2f 11 00 	movl   $0x100ee0,0x112fa4(,%edx,8)
  10187f:	e0 0e 10 00 
  101883:	8d 50 03             	lea    0x3(%eax),%edx
  101886:	89 15 80 2f 11 00    	mov    %edx,0x112f80
  10188c:	83 fa 0a             	cmp    $0xa,%edx
  10188f:	74 1e                	je     1018af <kernel_main+0xdf>
  101891:	c7 04 d5 a0 2f 11 00 	movl   $0x101fbb,0x112fa0(,%edx,8)
  101898:	bb 1f 10 00 
  10189c:	83 c0 04             	add    $0x4,%eax
  10189f:	c7 04 d5 a4 2f 11 00 	movl   $0x1009b0,0x112fa4(,%edx,8)
  1018a6:	b0 09 10 00 
  1018aa:	a3 80 2f 11 00       	mov    %eax,0x112f80
  1018af:	6a 0f                	push   $0xf
  1018b1:	bb 03 00 00 00       	mov    $0x3,%ebx
  1018b6:	68 c6 1f 10 00       	push   $0x101fc6
  1018bb:	e8 10 e9 ff ff       	call   1001d0 <print>
  1018c0:	a1 cc 2e 10 00       	mov    0x102ecc,%eax
  1018c5:	b9 02 00 00 00       	mov    $0x2,%ecx
  1018ca:	8d 50 01             	lea    0x1(%eax),%edx
  1018cd:	6b c0 6c             	imul   $0x6c,%eax,%eax
  1018d0:	89 15 cc 2e 10 00    	mov    %edx,0x102ecc
  1018d6:	89 88 30 2a 10 00    	mov    %ecx,0x102a30(%eax)
  1018dc:	b9 4f 00 00 00       	mov    $0x4f,%ecx
  1018e1:	89 98 34 2a 10 00    	mov    %ebx,0x102a34(%eax)
  1018e7:	5d                   	pop    %ebp
  1018e8:	5a                   	pop    %edx
  1018e9:	31 d2                	xor    %edx,%edx
  1018eb:	88 8c 02 38 2a 10 00 	mov    %cl,0x102a38(%edx,%eax,1)
  1018f2:	0f b6 8a e3 1f 10 00 	movzbl 0x101fe3(%edx),%ecx
  1018f9:	83 c2 01             	add    $0x1,%edx
  1018fc:	83 fa 1b             	cmp    $0x1b,%edx
  1018ff:	75 ea                	jne    1018eb <kernel_main+0x11b>
  101901:	c6 80 53 2a 10 00 00 	movb   $0x0,0x102a53(%eax)
  101908:	a1 cc 2e 10 00       	mov    0x102ecc,%eax
  10190d:	bb 04 00 00 00       	mov    $0x4,%ebx
  101912:	b9 02 00 00 00       	mov    $0x2,%ecx
  101917:	8d 50 01             	lea    0x1(%eax),%edx
  10191a:	6b c0 6c             	imul   $0x6c,%eax,%eax
  10191d:	89 15 cc 2e 10 00    	mov    %edx,0x102ecc
  101923:	31 d2                	xor    %edx,%edx
  101925:	89 98 34 2a 10 00    	mov    %ebx,0x102a34(%eax)
  10192b:	89 88 30 2a 10 00    	mov    %ecx,0x102a30(%eax)
  101931:	b9 52 00 00 00       	mov    $0x52,%ecx
  101936:	88 8c 02 38 2a 10 00 	mov    %cl,0x102a38(%edx,%eax,1)
  10193d:	0f b6 8a ff 1f 10 00 	movzbl 0x101fff(%edx),%ecx
  101944:	83 c2 01             	add    $0x1,%edx
  101947:	83 fa 1a             	cmp    $0x1a,%edx
  10194a:	75 ea                	jne    101936 <kernel_main+0x166>
  10194c:	8b 1d 60 2f 10 00    	mov    0x102f60,%ebx
  101952:	c6 80 52 2a 10 00 00 	movb   $0x0,0x102a52(%eax)
  101959:	8d 93 a0 00 00 00    	lea    0xa0(%ebx),%edx
  10195f:	8d 8b 40 10 00 00    	lea    0x1040(%ebx),%ecx
  101965:	8d 82 60 ff ff ff    	lea    -0xa0(%edx),%eax
  10196b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  101970:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  101977:	00 
  101978:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  10197f:	00 
  101980:	be 20 0f 00 00       	mov    $0xf20,%esi
  101985:	bf 20 0f 00 00       	mov    $0xf20,%edi
  10198a:	83 c0 04             	add    $0x4,%eax
  10198d:	66 89 70 fc          	mov    %si,-0x4(%eax)
  101991:	66 89 78 fe          	mov    %di,-0x2(%eax)
  101995:	39 c2                	cmp    %eax,%edx
  101997:	75 e7                	jne    101980 <kernel_main+0x1b0>
  101999:	81 c2 a0 00 00 00    	add    $0xa0,%edx
  10199f:	39 d1                	cmp    %edx,%ecx
  1019a1:	75 c2                	jne    101965 <kernel_main+0x195>
  1019a3:	6a 0f                	push   $0xf
  1019a5:	31 c0                	xor    %eax,%eax
  1019a7:	68 a8 20 10 00       	push   $0x1020a8
  1019ac:	66 a3 7c 5f 11 00    	mov    %ax,0x115f7c
  1019b2:	31 c0                	xor    %eax,%eax
  1019b4:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  1019ba:	31 c0                	xor    %eax,%eax
  1019bc:	66 a3 78 5f 11 00    	mov    %ax,0x115f78
  1019c2:	e8 09 e8 ff ff       	call   1001d0 <print>
  1019c7:	0f b7 05 78 5f 11 00 	movzwl 0x115f78,%eax
  1019ce:	0f b7 15 7a 5f 11 00 	movzwl 0x115f7a,%edx
  1019d5:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1019d8:	c1 e0 04             	shl    $0x4,%eax
  1019db:	01 d0                	add    %edx,%eax
  1019dd:	ba 3e 0b 00 00       	mov    $0xb3e,%edx
  1019e2:	66 89 14 43          	mov    %dx,(%ebx,%eax,2)
  1019e6:	0f b7 05 7a 5f 11 00 	movzwl 0x115f7a,%eax
  1019ed:	59                   	pop    %ecx
  1019ee:	5b                   	pop    %ebx
  1019ef:	83 c0 01             	add    $0x1,%eax
  1019f2:	66 83 f8 50          	cmp    $0x50,%ax
  1019f6:	0f 87 8a 02 00 00    	ja     101c86 <kernel_main+0x4b6>
  1019fc:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  101a02:	e4 64                	in     $0x64,%al
  101a04:	f7 d0                	not    %eax
  101a06:	a8 21                	test   $0x21,%al
  101a08:	0f 84 6e 02 00 00    	je     101c7c <kernel_main+0x4ac>
  101a0e:	8b 35 f8 2f 11 00    	mov    0x112ff8,%esi
  101a14:	85 f6                	test   %esi,%esi
  101a16:	0f 84 47 01 00 00    	je     101b63 <kernel_main+0x393>
  101a1c:	8b 1d 60 2f 10 00    	mov    0x102f60,%ebx
  101a22:	8d 93 a0 00 00 00    	lea    0xa0(%ebx),%edx
  101a28:	8d 8b 40 10 00 00    	lea    0x1040(%ebx),%ecx
  101a2e:	66 90                	xchg   %ax,%ax
  101a30:	8d 82 60 ff ff ff    	lea    -0xa0(%edx),%eax
  101a36:	66 90                	xchg   %ax,%ax
  101a38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  101a3f:	00 
  101a40:	bf 20 0f 00 00       	mov    $0xf20,%edi
  101a45:	bd 20 0f 00 00       	mov    $0xf20,%ebp
  101a4a:	83 c0 04             	add    $0x4,%eax
  101a4d:	66 89 78 fc          	mov    %di,-0x4(%eax)
  101a51:	66 89 68 fe          	mov    %bp,-0x2(%eax)
  101a55:	39 d0                	cmp    %edx,%eax
  101a57:	75 e7                	jne    101a40 <kernel_main+0x270>
  101a59:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101a5f:	39 d1                	cmp    %edx,%ecx
  101a61:	75 cd                	jne    101a30 <kernel_main+0x260>
  101a63:	31 c0                	xor    %eax,%eax
  101a65:	66 a3 7c 5f 11 00    	mov    %ax,0x115f7c
  101a6b:	31 c0                	xor    %eax,%eax
  101a6d:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  101a73:	31 c0                	xor    %eax,%eax
  101a75:	66 a3 78 5f 11 00    	mov    %ax,0x115f78
  101a7b:	a1 dc 2e 10 00       	mov    0x102edc,%eax
  101a80:	2b 05 f4 2f 11 00    	sub    0x112ff4,%eax
  101a86:	89 06                	mov    %eax,(%esi)
  101a88:	a1 d8 2e 10 00       	mov    0x102ed8,%eax
  101a8d:	2b 05 f0 2f 11 00    	sub    0x112ff0,%eax
  101a93:	89 46 04             	mov    %eax,0x4(%esi)
  101a96:	8b 35 fc 2f 11 00    	mov    0x112ffc,%esi
  101a9c:	85 f6                	test   %esi,%esi
  101a9e:	7e 1b                	jle    101abb <kernel_main+0x2eb>
  101aa0:	bd 00 30 11 00       	mov    $0x113000,%ebp
  101aa5:	31 ff                	xor    %edi,%edi
  101aa7:	55                   	push   %ebp
  101aa8:	83 c7 01             	add    $0x1,%edi
  101aab:	81 c5 b0 04 00 00    	add    $0x4b0,%ebp
  101ab1:	e8 aa f4 ff ff       	call   100f60 <draw_window>
  101ab6:	58                   	pop    %eax
  101ab7:	39 fe                	cmp    %edi,%esi
  101ab9:	75 ec                	jne    101aa7 <kernel_main+0x2d7>
  101abb:	b8 3e 0b 00 00       	mov    $0xb3e,%eax
  101ac0:	66 89 03             	mov    %ax,(%ebx)
  101ac3:	6a 00                	push   $0x0
  101ac5:	6a 01                	push   $0x1
  101ac7:	6a 0f                	push   $0xf
  101ac9:	68 00 5f 11 00       	push   $0x115f00
  101ace:	e8 3d e9 ff ff       	call   100410 <print_cords_local>
  101ad3:	83 c4 10             	add    $0x10,%esp
  101ad6:	8b 1d 6c 5f 11 00    	mov    0x115f6c,%ebx
  101adc:	85 db                	test   %ebx,%ebx
  101ade:	75 0a                	jne    101aea <kernel_main+0x31a>
  101ae0:	c7 05 f8 2f 11 00 00 	movl   $0x0,0x112ff8
  101ae7:	00 00 00 
  101aea:	31 db                	xor    %ebx,%ebx
  101aec:	80 3d 00 5f 11 00 00 	cmpb   $0x0,0x115f00
  101af3:	74 0c                	je     101b01 <kernel_main+0x331>
  101af5:	83 c3 01             	add    $0x1,%ebx
  101af8:	80 bb 00 5f 11 00 00 	cmpb   $0x0,0x115f00(%ebx)
  101aff:	75 f4                	jne    101af5 <kernel_main+0x325>
  101b01:	e4 64                	in     $0x64,%al
  101b03:	83 e0 21             	and    $0x21,%eax
  101b06:	3c 01                	cmp    $0x1,%al
  101b08:	0f 84 00 01 00 00    	je     101c0e <kernel_main+0x43e>
  101b0e:	8b 35 60 2f 10 00    	mov    0x102f60,%esi
  101b14:	a1 d8 2e 10 00       	mov    0x102ed8,%eax
  101b19:	0f b6 15 64 5f 11 00 	movzbl 0x115f64,%edx
  101b20:	8d 04 80             	lea    (%eax,%eax,4),%eax
  101b23:	c1 e2 08             	shl    $0x8,%edx
  101b26:	c1 e0 04             	shl    $0x4,%eax
  101b29:	83 ca 5e             	or     $0x5e,%edx
  101b2c:	03 05 dc 2e 10 00    	add    0x102edc,%eax
  101b32:	66 89 14 46          	mov    %dx,(%esi,%eax,2)
  101b36:	a1 e0 5e 11 00       	mov    0x115ee0,%eax
  101b3b:	85 c0                	test   %eax,%eax
  101b3d:	0f 84 bf fe ff ff    	je     101a02 <kernel_main+0x232>
  101b43:	83 ec 0c             	sub    $0xc,%esp
  101b46:	68 20 2a 10 00       	push   $0x102a20
  101b4b:	e8 10 f4 ff ff       	call   100f60 <draw_window>
  101b50:	83 c4 10             	add    $0x10,%esp
  101b53:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  101b58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  101b5f:	00 
  101b60:	f4                   	hlt
  101b61:	eb fd                	jmp    101b60 <kernel_main+0x390>
  101b63:	a1 68 5f 11 00       	mov    0x115f68,%eax
  101b68:	85 c0                	test   %eax,%eax
  101b6a:	0f 84 66 ff ff ff    	je     101ad6 <kernel_main+0x306>
  101b70:	8b 1d d8 2e 10 00    	mov    0x102ed8,%ebx
  101b76:	8b 35 dc 2e 10 00    	mov    0x102edc,%esi
  101b7c:	53                   	push   %ebx
  101b7d:	56                   	push   %esi
  101b7e:	e8 0d f7 ff ff       	call   101290 <get_window_at>
  101b83:	5f                   	pop    %edi
  101b84:	5d                   	pop    %ebp
  101b85:	89 c2                	mov    %eax,%edx
  101b87:	85 c0                	test   %eax,%eax
  101b89:	0f 84 47 ff ff ff    	je     101ad6 <kernel_main+0x306>
  101b8f:	2b 58 04             	sub    0x4(%eax),%ebx
  101b92:	2b 30                	sub    (%eax),%esi
  101b94:	31 c0                	xor    %eax,%eax
  101b96:	89 1d f0 2f 11 00    	mov    %ebx,0x112ff0
  101b9c:	8b 1d fc 2f 11 00    	mov    0x112ffc,%ebx
  101ba2:	89 35 f4 2f 11 00    	mov    %esi,0x112ff4
  101ba8:	85 db                	test   %ebx,%ebx
  101baa:	7f 1f                	jg     101bcb <kernel_main+0x3fb>
  101bac:	e9 eb 00 00 00       	jmp    101c9c <kernel_main+0x4cc>
  101bb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  101bb8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  101bbf:	00 
  101bc0:	83 c0 01             	add    $0x1,%eax
  101bc3:	39 c3                	cmp    %eax,%ebx
  101bc5:	0f 84 d1 00 00 00    	je     101c9c <kernel_main+0x4cc>
  101bcb:	69 c8 b0 04 00 00    	imul   $0x4b0,%eax,%ecx
  101bd1:	81 c1 00 30 11 00    	add    $0x113000,%ecx
  101bd7:	39 ca                	cmp    %ecx,%edx
  101bd9:	75 e5                	jne    101bc0 <kernel_main+0x3f0>
  101bdb:	83 ec 0c             	sub    $0xc,%esp
  101bde:	a3 d0 2e 10 00       	mov    %eax,0x102ed0
  101be3:	50                   	push   %eax
  101be4:	e8 87 f7 ff ff       	call   101370 <bring_window_to_front>
  101be9:	a1 fc 2f 11 00       	mov    0x112ffc,%eax
  101bee:	83 e8 01             	sub    $0x1,%eax
  101bf1:	69 c0 b0 04 00 00    	imul   $0x4b0,%eax,%eax
  101bf7:	05 00 30 11 00       	add    $0x113000,%eax
  101bfc:	a3 f8 2f 11 00       	mov    %eax,0x112ff8
  101c01:	e8 3a f8 ff ff       	call   101440 <render_windows>
  101c06:	83 c4 10             	add    $0x10,%esp
  101c09:	e9 c8 fe ff ff       	jmp    101ad6 <kernel_main+0x306>
  101c0e:	e4 64                	in     $0x64,%al
  101c10:	a8 01                	test   $0x1,%al
  101c12:	0f 84 f6 fe ff ff    	je     101b0e <kernel_main+0x33e>
  101c18:	a8 20                	test   $0x20,%al
  101c1a:	0f 85 ee fe ff ff    	jne    101b0e <kernel_main+0x33e>
  101c20:	e4 60                	in     $0x60,%al
  101c22:	84 c0                	test   %al,%al
  101c24:	0f 88 e4 fe ff ff    	js     101b0e <kernel_main+0x33e>
  101c2a:	0f b6 c0             	movzbl %al,%eax
  101c2d:	0f b6 80 e0 2e 10 00 	movzbl 0x102ee0(%eax),%eax
  101c34:	3c 08                	cmp    $0x8,%al
  101c36:	75 75                	jne    101cad <kernel_main+0x4dd>
  101c38:	85 db                	test   %ebx,%ebx
  101c3a:	74 07                	je     101c43 <kernel_main+0x473>
  101c3c:	c6 83 ff 5e 11 00 00 	movb   $0x0,0x115eff(%ebx)
  101c43:	0f b7 05 7a 5f 11 00 	movzwl 0x115f7a,%eax
  101c4a:	66 83 e8 01          	sub    $0x1,%ax
  101c4e:	74 56                	je     101ca6 <kernel_main+0x4d6>
  101c50:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  101c56:	0f b7 15 78 5f 11 00 	movzwl 0x115f78,%edx
  101c5d:	8b 35 60 2f 10 00    	mov    0x102f60,%esi
  101c63:	0f b7 c0             	movzwl %ax,%eax
  101c66:	b9 2f 00 00 00       	mov    $0x2f,%ecx
  101c6b:	8d 14 92             	lea    (%edx,%edx,4),%edx
  101c6e:	c1 e2 04             	shl    $0x4,%edx
  101c71:	01 d0                	add    %edx,%eax
  101c73:	66 89 0c 46          	mov    %cx,(%esi,%eax,2)
  101c77:	e9 98 fe ff ff       	jmp    101b14 <kernel_main+0x344>
  101c7c:	e8 bf ef ff ff       	call   100c40 <mouse_handler>
  101c81:	e9 88 fd ff ff       	jmp    101a0e <kernel_main+0x23e>
  101c86:	66 83 05 78 5f 11 00 	addw   $0x1,0x115f78
  101c8d:	01 
  101c8e:	66 c7 05 7a 5f 11 00 	movw   $0x0,0x115f7a
  101c95:	00 00 
  101c97:	e9 66 fd ff ff       	jmp    101a02 <kernel_main+0x232>
  101c9c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101ca1:	e9 35 ff ff ff       	jmp    101bdb <kernel_main+0x40b>
  101ca6:	b8 01 00 00 00       	mov    $0x1,%eax
  101cab:	eb a9                	jmp    101c56 <kernel_main+0x486>
  101cad:	3c 0a                	cmp    $0xa,%al
  101caf:	0f 85 2e 01 00 00    	jne    101de3 <kernel_main+0x613>
  101cb5:	e8 66 e9 ff ff       	call   100620 <clr>
  101cba:	6a 05                	push   $0x5
  101cbc:	8d 44 24 20          	lea    0x20(%esp),%eax
  101cc0:	50                   	push   %eax
  101cc1:	6a 20                	push   $0x20
  101cc3:	68 00 5f 11 00       	push   $0x115f00
  101cc8:	e8 f3 ea ff ff       	call   1007c0 <split>
  101ccd:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
  101cd1:	89 c7                	mov    %eax,%edi
  101cd3:	58                   	pop    %eax
  101cd4:	5a                   	pop    %edx
  101cd5:	68 19 20 10 00       	push   $0x102019
  101cda:	53                   	push   %ebx
  101cdb:	e8 00 ea ff ff       	call   1006e0 <cmpstr>
  101ce0:	83 c4 10             	add    $0x10,%esp
  101ce3:	85 c0                	test   %eax,%eax
  101ce5:	74 57                	je     101d3e <kernel_main+0x56e>
  101ce7:	50                   	push   %eax
  101ce8:	50                   	push   %eax
  101ce9:	6a 0a                	push   $0xa
  101ceb:	68 dc 20 10 00       	push   $0x1020dc
  101cf0:	e8 db e4 ff ff       	call   1001d0 <print>
  101cf5:	83 c4 10             	add    $0x10,%esp
  101cf8:	e8 43 f7 ff ff       	call   101440 <render_windows>
  101cfd:	0f b7 05 78 5f 11 00 	movzwl 0x115f78,%eax
  101d04:	0f b7 15 7a 5f 11 00 	movzwl 0x115f7a,%edx
  101d0b:	c6 05 00 5f 11 00 00 	movb   $0x0,0x115f00
  101d12:	8b 35 60 2f 10 00    	mov    0x102f60,%esi
  101d18:	6b c0 50             	imul   $0x50,%eax,%eax
  101d1b:	01 d0                	add    %edx,%eax
  101d1d:	66 c7 04 46 3e 0b    	movw   $0xb3e,(%esi,%eax,2)
  101d23:	0f b7 05 7a 5f 11 00 	movzwl 0x115f7a,%eax
  101d2a:	83 c0 01             	add    $0x1,%eax
  101d2d:	66 83 f8 50          	cmp    $0x50,%ax
  101d31:	77 32                	ja     101d65 <kernel_main+0x595>
  101d33:	66 a3 7a 5f 11 00    	mov    %ax,0x115f7a
  101d39:	e9 d6 fd ff ff       	jmp    101b14 <kernel_main+0x344>
  101d3e:	50                   	push   %eax
  101d3f:	50                   	push   %eax
  101d40:	68 1e 20 10 00       	push   $0x10201e
  101d45:	53                   	push   %ebx
  101d46:	e8 95 e9 ff ff       	call   1006e0 <cmpstr>
  101d4b:	83 c4 10             	add    $0x10,%esp
  101d4e:	85 c0                	test   %eax,%eax
  101d50:	74 29                	je     101d7b <kernel_main+0x5ab>
  101d52:	50                   	push   %eax
  101d53:	50                   	push   %eax
  101d54:	6a 0a                	push   $0xa
  101d56:	68 a8 20 10 00       	push   $0x1020a8
  101d5b:	e8 70 e4 ff ff       	call   1001d0 <print>
  101d60:	83 c4 10             	add    $0x10,%esp
  101d63:	eb 93                	jmp    101cf8 <kernel_main+0x528>
  101d65:	66 83 05 78 5f 11 00 	addw   $0x1,0x115f78
  101d6c:	01 
  101d6d:	66 c7 05 7a 5f 11 00 	movw   $0x0,0x115f7a
  101d74:	00 00 
  101d76:	e9 99 fd ff ff       	jmp    101b14 <kernel_main+0x344>
  101d7b:	55                   	push   %ebp
  101d7c:	55                   	push   %ebp
  101d7d:	68 24 20 10 00       	push   $0x102024
  101d82:	53                   	push   %ebx
  101d83:	e8 58 e9 ff ff       	call   1006e0 <cmpstr>
  101d88:	83 c4 10             	add    $0x10,%esp
  101d8b:	85 c0                	test   %eax,%eax
  101d8d:	74 0a                	je     101d99 <kernel_main+0x5c9>
  101d8f:	e8 8c e8 ff ff       	call   100620 <clr>
  101d94:	e9 5f ff ff ff       	jmp    101cf8 <kernel_main+0x528>
  101d99:	56                   	push   %esi
  101d9a:	56                   	push   %esi
  101d9b:	68 2a 20 10 00       	push   $0x10202a
  101da0:	53                   	push   %ebx
  101da1:	e8 3a e9 ff ff       	call   1006e0 <cmpstr>
  101da6:	83 c4 10             	add    $0x10,%esp
  101da9:	85 c0                	test   %eax,%eax
  101dab:	75 7b                	jne    101e28 <kernel_main+0x658>
  101dad:	51                   	push   %ecx
  101dae:	51                   	push   %ecx
  101daf:	68 2e 20 10 00       	push   $0x10202e
  101db4:	53                   	push   %ebx
  101db5:	e8 26 e9 ff ff       	call   1006e0 <cmpstr>
  101dba:	83 c4 10             	add    $0x10,%esp
  101dbd:	89 c6                	mov    %eax,%esi
  101dbf:	85 c0                	test   %eax,%eax
  101dc1:	74 7b                	je     101e3e <kernel_main+0x66e>
  101dc3:	a1 fc 2f 11 00       	mov    0x112ffc,%eax
  101dc8:	31 d2                	xor    %edx,%edx
  101dca:	83 e8 01             	sub    $0x1,%eax
  101dcd:	a3 fc 2f 11 00       	mov    %eax,0x112ffc
  101dd2:	69 c0 b0 04 00 00    	imul   $0x4b0,%eax,%eax
  101dd8:	89 90 ac 34 11 00    	mov    %edx,0x1134ac(%eax)
  101dde:	e9 15 ff ff ff       	jmp    101cf8 <kernel_main+0x528>
  101de3:	8b 35 60 2f 10 00    	mov    0x102f60,%esi
  101de9:	84 c0                	test   %al,%al
  101deb:	0f 84 23 fd ff ff    	je     101b14 <kernel_main+0x344>
  101df1:	52                   	push   %edx
  101df2:	52                   	push   %edx
  101df3:	0f be d0             	movsbl %al,%edx
  101df6:	6a 0f                	push   $0xf
  101df8:	88 44 24 1b          	mov    %al,0x1b(%esp)
  101dfc:	52                   	push   %edx
  101dfd:	e8 5e e3 ff ff       	call   100160 <printc>
  101e02:	83 c4 10             	add    $0x10,%esp
  101e05:	31 d2                	xor    %edx,%edx
  101e07:	0f b6 44 24 0f       	movzbl 0xf(%esp),%eax
  101e0c:	80 3d 00 5f 11 00 00 	cmpb   $0x0,0x115f00
  101e13:	0f 44 da             	cmove  %edx,%ebx
  101e16:	88 83 00 5f 11 00    	mov    %al,0x115f00(%ebx)
  101e1c:	c6 83 01 5f 11 00 00 	movb   $0x0,0x115f01(%ebx)
  101e23:	e9 ec fc ff ff       	jmp    101b14 <kernel_main+0x344>
  101e28:	53                   	push   %ebx
  101e29:	ff 74 24 24          	push   0x24(%esp)
  101e2d:	6a 09                	push   $0x9
  101e2f:	6a 1e                	push   $0x1e
  101e31:	e8 fa ef ff ff       	call   100e30 <create_window>
  101e36:	83 c4 10             	add    $0x10,%esp
  101e39:	e9 ba fe ff ff       	jmp    101cf8 <kernel_main+0x528>
  101e3e:	50                   	push   %eax
  101e3f:	50                   	push   %eax
  101e40:	68 34 20 10 00       	push   $0x102034
  101e45:	53                   	push   %ebx
  101e46:	e8 95 e8 ff ff       	call   1006e0 <cmpstr>
  101e4b:	83 c4 10             	add    $0x10,%esp
  101e4e:	85 c0                	test   %eax,%eax
  101e50:	75 2c                	jne    101e7e <kernel_main+0x6ae>
  101e52:	50                   	push   %eax
  101e53:	50                   	push   %eax
  101e54:	68 4a 20 10 00       	push   $0x10204a
  101e59:	53                   	push   %ebx
  101e5a:	e8 81 e8 ff ff       	call   1006e0 <cmpstr>
  101e5f:	83 c4 10             	add    $0x10,%esp
  101e62:	85 c0                	test   %eax,%eax
  101e64:	74 5f                	je     101ec5 <kernel_main+0x6f5>
  101e66:	55                   	push   %ebp
  101e67:	55                   	push   %ebp
  101e68:	8d 44 24 28          	lea    0x28(%esp),%eax
  101e6c:	50                   	push   %eax
  101e6d:	8d 47 ff             	lea    -0x1(%edi),%eax
  101e70:	50                   	push   %eax
  101e71:	e8 3a f8 ff ff       	call   1016b0 <run_app>
  101e76:	83 c4 10             	add    $0x10,%esp
  101e79:	e9 7a fe ff ff       	jmp    101cf8 <kernel_main+0x528>
  101e7e:	50                   	push   %eax
  101e7f:	50                   	push   %eax
  101e80:	6a 0a                	push   $0xa
  101e82:	68 3b 20 10 00       	push   $0x10203b
  101e87:	e8 44 e3 ff ff       	call   1001d0 <print>
  101e8c:	83 c4 10             	add    $0x10,%esp
  101e8f:	eb 27                	jmp    101eb8 <kernel_main+0x6e8>
  101e91:	50                   	push   %eax
  101e92:	50                   	push   %eax
  101e93:	6a 0f                	push   $0xf
  101e95:	ff 34 f5 a0 2f 11 00 	push   0x112fa0(,%esi,8)
  101e9c:	83 c6 01             	add    $0x1,%esi
  101e9f:	e8 2c e3 ff ff       	call   1001d0 <print>
  101ea4:	83 c4 10             	add    $0x10,%esp
  101ea7:	66 83 05 78 5f 11 00 	addw   $0x1,0x115f78
  101eae:	01 
  101eaf:	66 c7 05 7a 5f 11 00 	movw   $0x0,0x115f7a
  101eb6:	00 00 
  101eb8:	39 35 80 2f 11 00    	cmp    %esi,0x112f80
  101ebe:	7f d1                	jg     101e91 <kernel_main+0x6c1>
  101ec0:	e9 33 fe ff ff       	jmp    101cf8 <kernel_main+0x528>
  101ec5:	57                   	push   %edi
  101ec6:	57                   	push   %edi
  101ec7:	68 4e 20 10 00       	push   $0x10204e
  101ecc:	53                   	push   %ebx
  101ecd:	e8 0e e8 ff ff       	call   1006e0 <cmpstr>
  101ed2:	83 c4 10             	add    $0x10,%esp
  101ed5:	85 c0                	test   %eax,%eax
  101ed7:	74 0a                	je     101ee3 <kernel_main+0x713>
  101ed9:	e8 b2 f5 ff ff       	call   101490 <erease_windows>
  101ede:	e9 15 fe ff ff       	jmp    101cf8 <kernel_main+0x528>
  101ee3:	56                   	push   %esi
  101ee4:	56                   	push   %esi
  101ee5:	68 55 20 10 00       	push   $0x102055
  101eea:	53                   	push   %ebx
  101eeb:	e8 f0 e7 ff ff       	call   1006e0 <cmpstr>
  101ef0:	83 c4 10             	add    $0x10,%esp
  101ef3:	85 c0                	test   %eax,%eax
  101ef5:	74 20                	je     101f17 <kernel_main+0x747>
  101ef7:	53                   	push   %ebx
  101ef8:	53                   	push   %ebx
  101ef9:	6a 0a                	push   $0xa
  101efb:	68 5b 20 10 00       	push   $0x10205b
  101f00:	e8 cb e2 ff ff       	call   1001d0 <print>
  101f05:	83 c4 10             	add    $0x10,%esp
  101f08:	c7 05 e0 5e 11 00 01 	movl   $0x1,0x115ee0
  101f0f:	00 00 00 
  101f12:	e9 e1 fd ff ff       	jmp    101cf8 <kernel_main+0x528>
  101f17:	51                   	push   %ecx
  101f18:	51                   	push   %ecx
  101f19:	6a 0c                	push   $0xc
  101f1b:	68 72 20 10 00       	push   $0x102072
  101f20:	e8 ab e2 ff ff       	call   1001d0 <print>
  101f25:	83 c4 10             	add    $0x10,%esp
  101f28:	e9 cb fd ff ff       	jmp    101cf8 <kernel_main+0x528>

Дизассемблирование раздела .rodata.str1.1:

00101f2d <.rodata.str1.1>:
  101f2d:	68 65 6c 6c 6f       	push   $0x6f6c6c65
  101f32:	20 77 6f             	and    %dh,0x6f(%edi)
  101f35:	72 6c                	jb     101fa3 <kernel_main+0x7d3>
  101f37:	64 21 0a             	and    %ecx,%fs:(%edx)
  101f3a:	00 2c 20             	add    %ch,(%eax,%eiz,1)
  101f3d:	6e                   	outsb  %ds:(%esi),(%dx)
  101f3e:	69 63 65 20 74 6f 20 	imul   $0x206f7420,0x65(%ebx),%esp
  101f45:	6d                   	insl   (%dx),%es:(%edi)
  101f46:	65 65 74 20          	gs gs je 101f6a <kernel_main+0x79a>
  101f4a:	79 6f                	jns    101fbb <kernel_main+0x7eb>
  101f4c:	75 21                	jne    101f6f <kernel_main+0x79f>
  101f4e:	0a 00                	or     (%eax),%al
  101f50:	48                   	dec    %eax
  101f51:	65 6c                	gs insb (%dx),%es:(%edi)
  101f53:	6c                   	insb   (%dx),%es:(%edi)
  101f54:	6f                   	outsl  %ds:(%esi),(%dx)
  101f55:	20 57 6f             	and    %dl,0x6f(%edi)
  101f58:	72 6c                	jb     101fc6 <kernel_main+0x7f6>
  101f5a:	64 00 48 65          	add    %cl,%fs:0x65(%eax)
  101f5e:	6c                   	insb   (%dx),%es:(%edi)
  101f5f:	6c                   	insb   (%dx),%es:(%edi)
  101f60:	6f                   	outsl  %ds:(%esi),(%dx)
  101f61:	20 77 6f             	and    %dh,0x6f(%edi)
  101f64:	72 6c                	jb     101fd2 <kernel_main+0x802>
  101f66:	64 21 00             	and    %eax,%fs:(%eax)
  101f69:	41                   	inc    %ecx
  101f6a:	70 70                	jo     101fdc <kernel_main+0x80c>
  101f6c:	20 6e 6f             	and    %ch,0x6f(%esi)
  101f6f:	74 20                	je     101f91 <kernel_main+0x7c1>
  101f71:	66 6f                	outsw  %ds:(%esi),(%dx)
  101f73:	75 6e                	jne    101fe3 <kernel_main+0x813>
  101f75:	64 0a 00             	or     %fs:(%eax),%al
  101f78:	49                   	dec    %ecx
  101f79:	6e                   	outsb  %ds:(%esi),(%dx)
  101f7a:	69 74 69 6e 67 20 6d 	imul   $0x6f6d2067,0x6e(%ecx,%ebp,2),%esi
  101f81:	6f 
  101f82:	75 73                	jne    101ff7 <kernel_main+0x827>
  101f84:	65 2e 2e 2e 0a 00    	gs cs cs or %cs:(%eax),%al
  101f8a:	4c                   	dec    %esp
  101f8b:	6f                   	outsl  %ds:(%esi),(%dx)
  101f8c:	61                   	popa
  101f8d:	64 69 6e 67 20 62 75 	imul   $0x69756220,%fs:0x67(%esi),%ebp
  101f94:	69 
  101f95:	6c                   	insb   (%dx),%es:(%edi)
  101f96:	74 2d                	je     101fc5 <kernel_main+0x7f5>
  101f98:	69 6e 20 61 70 70 73 	imul   $0x73707061,0x20(%esi),%ebp
  101f9f:	2e 2e 2e 0a 00       	cs cs or %cs:(%eax),%al
  101fa4:	65 63 68 6f          	arpl   %ebp,%gs:0x6f(%eax)
  101fa8:	00 66 61             	add    %ah,0x61(%esi)
  101fab:	6e                   	outsb  %ds:(%esi),(%dx)
  101fac:	63 79 2d             	arpl   %edi,0x2d(%ecx)
  101faf:	68 65 6c 6c 6f       	push   $0x6f6c6c65
  101fb4:	2d 77 6f 72 6c       	sub    $0x6c726f77,%eax
  101fb9:	64 00 68 65          	add    %ch,%fs:0x65(%eax)
  101fbd:	6c                   	insb   (%dx),%es:(%edi)
  101fbe:	6c                   	insb   (%dx),%es:(%edi)
  101fbf:	6f                   	outsl  %ds:(%esi),(%dx)
  101fc0:	2d 6e 61 6d 65       	sub    $0x656d616e,%eax
  101fc5:	00 44 6f 69          	add    %al,0x69(%edi,%ebp,2)
  101fc9:	6e                   	outsb  %ds:(%esi),(%dx)
  101fca:	67 20 73 6f          	and    %dh,0x6f(%bp,%di)
  101fce:	6d                   	insl   (%dx),%es:(%edi)
  101fcf:	65 74 68             	gs je  10203a <kernel_main+0x86a>
  101fd2:	69 6e 67 20 75 73 65 	imul   $0x65737520,0x67(%esi),%ebp
  101fd9:	6c                   	insb   (%dx),%es:(%edi)
  101fda:	65 73 73             	gs jae 102050 <kernel_main+0x880>
  101fdd:	2e 2e 2e 0a 00       	cs cs or %cs:(%eax),%al
  101fe2:	4f                   	dec    %edi
  101fe3:	53                   	push   %ebx
  101fe4:	20 69 73             	and    %ch,0x73(%ecx)
  101fe7:	20 72 61             	and    %dh,0x61(%edx)
  101fea:	6e                   	outsb  %ds:(%esi),(%dx)
  101feb:	20 69 6e             	and    %ch,0x6e(%ecx)
  101fee:	74 6f                	je     10205f <kernel_main+0x88f>
  101ff0:	20 66 61             	and    %ah,0x61(%esi)
  101ff3:	74 61                	je     102056 <kernel_main+0x886>
  101ff5:	6c                   	insb   (%dx),%es:(%edi)
  101ff6:	20 65 72             	and    %ah,0x72(%ebp)
  101ff9:	72 6f                	jb     10206a <kernel_main+0x89a>
  101ffb:	72 2e                	jb     10202b <kernel_main+0x85b>
  101ffd:	00 52 65             	add    %dl,0x65(%edx)
  102000:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  102003:	74 20                	je     102025 <kernel_main+0x855>
  102005:	6d                   	insl   (%dx),%es:(%edi)
  102006:	61                   	popa
  102007:	6e                   	outsb  %ds:(%esi),(%dx)
  102008:	75 61                	jne    10206b <kernel_main+0x89b>
  10200a:	6c                   	insb   (%dx),%es:(%edi)
  10200b:	79 2c                	jns    102039 <kernel_main+0x869>
  10200d:	20 68 61             	and    %ch,0x61(%eax)
  102010:	6c                   	insb   (%dx),%es:(%edi)
  102011:	74 69                	je     10207c <kernel_main+0x8ac>
  102013:	6e                   	outsb  %ds:(%esi),(%dx)
  102014:	67 2e 2e 2e 00 68 65 	cs cs add %ch,%cs:0x65(%bx,%si)
  10201b:	6c                   	insb   (%dx),%es:(%edi)
  10201c:	70 00                	jo     10201e <kernel_main+0x84e>
  10201e:	61                   	popa
  10201f:	62 6f 75             	bound  %ebp,0x75(%edi)
  102022:	74 00                	je     102024 <kernel_main+0x854>
  102024:	63 6c 65 61          	arpl   %ebp,0x61(%ebp,%eiz,2)
  102028:	72 00                	jb     10202a <kernel_main+0x85a>
  10202a:	77 69                	ja     102095 <kernel_main+0x8c5>
  10202c:	6e                   	outsb  %ds:(%esi),(%dx)
  10202d:	00 63 6c             	add    %ah,0x6c(%ebx)
  102030:	6f                   	outsl  %ds:(%esi),(%dx)
  102031:	73 65                	jae    102098 <kernel_main+0x8c8>
  102033:	00 6c 73 61          	add    %ch,0x61(%ebx,%esi,2)
  102037:	70 70                	jo     1020a9 <kernel_main+0x8d9>
  102039:	73 00                	jae    10203b <kernel_main+0x86b>
  10203b:	6c                   	insb   (%dx),%es:(%edi)
  10203c:	69 73 74 20 6f 66 20 	imul   $0x20666f20,0x74(%ebx),%esi
  102043:	61                   	popa
  102044:	70 70                	jo     1020b6 <kernel_main+0x8e6>
  102046:	73 3a                	jae    102082 <kernel_main+0x8b2>
  102048:	0a 00                	or     (%eax),%al
  10204a:	72 75                	jb     1020c1 <kernel_main+0x8f1>
  10204c:	6e                   	outsb  %ds:(%esi),(%dx)
  10204d:	00 65 72             	add    %ah,0x72(%ebp)
  102050:	65 61                	gs popa
  102052:	73 65                	jae    1020b9 <kernel_main+0x8e9>
  102054:	00 70 61             	add    %dh,0x61(%eax)
  102057:	6e                   	outsb  %ds:(%esi),(%dx)
  102058:	69 63 00 41 61 61 61 	imul   $0x61616141,0x0(%ebx),%esp
  10205f:	61                   	popa
  102060:	61                   	popa
  102061:	21 20                	and    %esp,(%eax)
  102063:	48                   	dec    %eax
  102064:	61                   	popa
  102065:	6c                   	insb   (%dx),%es:(%edi)
  102066:	74 69                	je     1020d1 <kernel_main+0x901>
  102068:	6e                   	outsb  %ds:(%esi),(%dx)
  102069:	67 21 20             	and    %esp,(%bx,%si)
  10206c:	4e                   	dec    %esi
  10206d:	6f                   	outsl  %ds:(%esi),(%dx)
  10206e:	77 21                	ja     102091 <kernel_main+0x8c1>
  102070:	0a 00                	or     (%eax),%al
  102072:	75 6e                	jne    1020e2 <kernel_main+0x912>
  102074:	6b 6e 6f 77          	imul   $0x77,0x6f(%esi),%ebp
  102078:	6e                   	outsb  %ds:(%esi),(%dx)
  102079:	0a 00                	or     (%eax),%al

Дизассемблирование раздела .rodata.str1.4:

0010207c <.rodata.str1.4>:
  10207c:	48                   	dec    %eax
  10207d:	65 6c                	gs insb (%dx),%es:(%edi)
  10207f:	6c                   	insb   (%dx),%es:(%edi)
  102080:	6f                   	outsl  %ds:(%esi),(%dx)
  102081:	21 20                	and    %esp,(%eax)
  102083:	57                   	push   %edi
  102084:	68 61 74 20 69       	push   $0x69207461
  102089:	73 20                	jae    1020ab <kernel_main+0x8db>
  10208b:	79 6f                	jns    1020fc <kernel_main+0x92c>
  10208d:	75 72                	jne    102101 <kernel_main+0x931>
  10208f:	20 6e 61             	and    %ch,0x61(%esi)
  102092:	6d                   	insl   (%dx),%es:(%edi)
  102093:	65 3f                	gs aas
  102095:	0a 65 6e             	or     0x6e(%ebp),%ah
  102098:	74 65                	je     1020ff <kernel_main+0x92f>
  10209a:	72 20                	jb     1020bc <kernel_main+0x8ec>
  10209c:	79 6f                	jns    10210d <kernel_main+0x93d>
  10209e:	75 72                	jne    102112 <kernel_main+0x942>
  1020a0:	20 6e 61             	and    %ch,0x61(%esi)
  1020a3:	6d                   	insl   (%dx),%es:(%edi)
  1020a4:	65 3a 00             	cmp    %gs:(%eax),%al
  1020a7:	00 4f 67             	add    %cl,0x67(%edi)
  1020aa:	72 69                	jb     102115 <kernel_main+0x945>
  1020ac:	7a 6f                	jp     10211d <kernel_main+0x94d>
  1020ae:	6b 4f 53 20          	imul   $0x20,0x53(%edi),%ecx
  1020b2:	76 30                	jbe    1020e4 <kernel_main+0x914>
  1020b4:	2e 6e                	outsb  %cs:(%esi),(%dx)
  1020b6:	6f                   	outsl  %ds:(%esi),(%dx)
  1020b7:	0a 49 60             	or     0x60(%ecx),%cl
  1020ba:	6d                   	insl   (%dx),%es:(%edi)
  1020bb:	20 6e 6f             	and    %ch,0x6f(%esi)
  1020be:	74 20                	je     1020e0 <kernel_main+0x910>
  1020c0:	72 65                	jb     102127 <kernel_main+0x957>
  1020c2:	73 70                	jae    102134 <kernel_main+0x964>
  1020c4:	6f                   	outsl  %ds:(%esi),(%dx)
  1020c5:	73 69                	jae    102130 <kernel_main+0x960>
  1020c7:	62 6c 65 20          	bound  %ebp,0x20(%ebp,%eiz,2)
  1020cb:	66 6f                	outsw  %ds:(%esi),(%dx)
  1020cd:	72 20                	jb     1020ef <kernel_main+0x91f>
  1020cf:	61                   	popa
  1020d0:	6e                   	outsb  %ds:(%esi),(%dx)
  1020d1:	79 74                	jns    102147 <kernel_main+0x977>
  1020d3:	68 69 6e 67 0a       	push   $0xa676e69
  1020d8:	00 00                	add    %al,(%eax)
  1020da:	00 00                	add    %al,(%eax)
  1020dc:	68 65 6c 70 20       	push   $0x20706c65
  1020e1:	2d 20 68 65 6c       	sub    $0x6c656820,%eax
  1020e6:	70 0a                	jo     1020f2 <kernel_main+0x922>
  1020e8:	61                   	popa
  1020e9:	62 6f 75             	bound  %ebp,0x75(%edi)
  1020ec:	74 20                	je     10210e <kernel_main+0x93e>
  1020ee:	2d 20 61 62 6f       	sub    $0x6f626120,%eax
  1020f3:	75 74                	jne    102169 <kernel_main+0x999>
  1020f5:	20 6f 73             	and    %ch,0x73(%edi)
  1020f8:	0a 63 6c             	or     0x6c(%ebx),%ah
  1020fb:	65 61                	gs popa
  1020fd:	72 20                	jb     10211f <kernel_main+0x94f>
  1020ff:	2d 20 63 6c 65       	sub    $0x656c6320,%eax
  102104:	61                   	popa
  102105:	72 20                	jb     102127 <kernel_main+0x957>
  102107:	73 63                	jae    10216c <kernel_main+0x99c>
  102109:	72 65                	jb     102170 <kernel_main+0x9a0>
  10210b:	65 6e                	outsb  %gs:(%esi),(%dx)
  10210d:	0a 77 69             	or     0x69(%edi),%dh
  102110:	6e                   	outsb  %ds:(%esi),(%dx)
  102111:	20 3c 74             	and    %bh,(%esp,%esi,2)
  102114:	69 74 6c 65 3e 20 2d 	imul   $0x202d203e,0x65(%esp,%ebp,2),%esi
  10211b:	20 
  10211c:	6f                   	outsl  %ds:(%esi),(%dx)
  10211d:	70 65                	jo     102184 <kernel_main+0x9b4>
  10211f:	6e                   	outsb  %ds:(%esi),(%dx)
  102120:	20 6e 65             	and    %ch,0x65(%esi)
  102123:	77 20                	ja     102145 <kernel_main+0x975>
  102125:	77 69                	ja     102190 <kernel_main+0x9c0>
  102127:	6e                   	outsb  %ds:(%esi),(%dx)
  102128:	64 6f                	outsl  %fs:(%esi),(%dx)
  10212a:	77 0a                	ja     102136 <kernel_main+0x966>
  10212c:	63 6c 6f 73          	arpl   %ebp,0x73(%edi,%ebp,2)
  102130:	65 20 2d 20 63 6c 6f 	and    %ch,%gs:0x6f6c6320
  102137:	73 65                	jae    10219e <kernel_main+0x9ce>
  102139:	20 77 69             	and    %dh,0x69(%edi)
  10213c:	6e                   	outsb  %ds:(%esi),(%dx)
  10213d:	64 6f                	outsl  %fs:(%esi),(%dx)
  10213f:	77 0a                	ja     10214b <kernel_main+0x97b>
  102141:	6c                   	insb   (%dx),%es:(%edi)
  102142:	73 61                	jae    1021a5 <kernel_main+0x9d5>
  102144:	70 70                	jo     1021b6 <kernel_main+0x9e6>
  102146:	73 20                	jae    102168 <kernel_main+0x998>
  102148:	2d 20 6c 69 73       	sub    $0x73696c20,%eax
  10214d:	74 20                	je     10216f <kernel_main+0x99f>
  10214f:	6f                   	outsl  %ds:(%esi),(%dx)
  102150:	66 20 61 6c          	data16 and %ah,0x6c(%ecx)
  102154:	6c                   	insb   (%dx),%es:(%edi)
  102155:	20 61 70             	and    %ah,0x70(%ecx)
  102158:	70 73                	jo     1021cd <kernel_main+0x9fd>
  10215a:	0a 72 75             	or     0x75(%edx),%dh
  10215d:	6e                   	outsb  %ds:(%esi),(%dx)
  10215e:	20 3c 61             	and    %bh,(%ecx,%eiz,2)
  102161:	70 70                	jo     1021d3 <kernel_main+0xa03>
  102163:	3e 20 2d 20 72 75 6e 	and    %ch,%ds:0x6e757220
  10216a:	20 61 70             	and    %ah,0x70(%ecx)
  10216d:	70 0a                	jo     102179 <kernel_main+0x9a9>
  10216f:	70 61                	jo     1021d2 <kernel_main+0xa02>
  102171:	6e                   	outsb  %ds:(%esi),(%dx)
  102172:	69 63 20 2d 20 6d 61 	imul   $0x616d202d,0x20(%ebx),%esp
  102179:	6b 65 20 6f          	imul   $0x6f,0x20(%ebp),%esp
  10217d:	73 20                	jae    10219f <kernel_main+0x9cf>
  10217f:	70 61                	jo     1021e2 <kernel_main+0xa12>
  102181:	6e                   	outsb  %ds:(%esi),(%dx)
  102182:	69 63 20 61 6e 64 20 	imul   $0x20646e61,0x20(%ebx),%esp
  102189:	68 61 6c 74 0a       	push   $0xa746c61
	...

Дизассемблирование раздела .rodata.cst8:

00102190 <.rodata.cst8>:
  102190:	05 00 00 00 02       	add    $0x2000000,%eax
  102195:	00 00                	add    %al,(%eax)
	...

Дизассемблирование раздела .eh_frame:

00102198 <.eh_frame>:
  102198:	14 00                	adc    $0x0,%al
  10219a:	00 00                	add    %al,(%eax)
  10219c:	00 00                	add    %al,(%eax)
  10219e:	00 00                	add    %al,(%eax)
  1021a0:	01 7a 52             	add    %edi,0x52(%edx)
  1021a3:	00 01                	add    %al,(%ecx)
  1021a5:	7c 08                	jl     1021af <kernel_main+0x9df>
  1021a7:	01 1b                	add    %ebx,(%ebx)
  1021a9:	0c 04                	or     $0x4,%al
  1021ab:	04 88                	add    $0x88,%al
  1021ad:	01 00                	add    %eax,(%eax)
  1021af:	00 20                	add    %ah,(%eax)
  1021b1:	00 00                	add    %al,(%eax)
  1021b3:	00 1c 00             	add    %bl,(%eax,%eax,1)
  1021b6:	00 00                	add    %al,(%eax)
  1021b8:	c8 de ff ff          	enter  $0xffde,$0xff
  1021bc:	79 00                	jns    1021be <kernel_main+0x9ee>
  1021be:	00 00                	add    %al,(%eax)
  1021c0:	00 41 0e             	add    %al,0xe(%ecx)
  1021c3:	08 86 02 4b 0e 0c    	or     %al,0xc0e4b02(%esi)
  1021c9:	83 03 02             	addl   $0x2,(%ebx)
  1021cc:	6b c3 0e             	imul   $0xe,%ebx,%eax
  1021cf:	08 41 c6             	or     %al,-0x3a(%ecx)
  1021d2:	0e                   	push   %cs
  1021d3:	04 10                	add    $0x10,%al
  1021d5:	00 00                	add    %al,(%eax)
  1021d7:	00 40 00             	add    %al,0x0(%eax)
  1021da:	00 00                	add    %al,(%eax)
  1021dc:	24 df                	and    $0xdf,%al
  1021de:	ff                   	(bad)
  1021df:	ff 11                	call   *(%ecx)
  1021e1:	00 00                	add    %al,(%eax)
  1021e3:	00 00                	add    %al,(%eax)
  1021e5:	00 00                	add    %al,(%eax)
  1021e7:	00 10                	add    %dl,(%eax)
  1021e9:	00 00                	add    %al,(%eax)
  1021eb:	00 54 00 00          	add    %dl,0x0(%eax,%eax,1)
  1021ef:	00 30                	add    %dh,(%eax)
  1021f1:	df ff                	(bad)
  1021f3:	ff 31                	push   (%ecx)
  1021f5:	00 00                	add    %al,(%eax)
  1021f7:	00 00                	add    %al,(%eax)
  1021f9:	00 00                	add    %al,(%eax)
  1021fb:	00 14 00             	add    %dl,(%eax,%eax,1)
  1021fe:	00 00                	add    %al,(%eax)
  102200:	68 00 00 00 5c       	push   $0x5c000000
  102205:	df ff                	(bad)
  102207:	ff 6b 00             	ljmp   *0x0(%ebx)
  10220a:	00 00                	add    %al,(%eax)
  10220c:	00 43 0e             	add    %al,0xe(%ebx)
  10220f:	08 02                	or     %al,(%edx)
  102211:	67 0e                	addr16 push %cs
  102213:	04 24                	add    $0x24,%al
  102215:	00 00                	add    %al,(%eax)
  102217:	00 80 00 00 00 b4    	add    %al,-0x4c000000(%eax)
  10221d:	df ff                	(bad)
  10221f:	ff a1 00 00 00 00    	jmp    *0x0(%ecx)
  102225:	43                   	inc    %ebx
  102226:	0e                   	push   %cs
  102227:	14 5d                	adc    $0x5d,%al
  102229:	83 04 4d 87 02 86 03 	addl   $0x2,0x3860287(,%ecx,2)
  102230:	02 
  102231:	68 c3 44 c6 44       	push   $0x44c644c3
  102236:	c7 43 0e 04 00 00 3c 	movl   $0x3c000004,0xe(%ebx)
  10223d:	00 00                	add    %al,(%eax)
  10223f:	00 a8 00 00 00 3c    	add    %ch,0x3c000000(%eax)
  102245:	e0 ff                	loopne 102246 <kernel_main+0xa76>
  102247:	ff 8e 00 00 00 00    	decl   0x0(%esi)
  10224d:	43                   	inc    %ebx
  10224e:	0e                   	push   %cs
  10224f:	14 44                	adc    $0x44,%al
  102251:	86 04 48             	xchg   %al,(%eax,%ecx,2)
  102254:	87 03                	xchg   %eax,(%ebx)
  102256:	50                   	push   %eax
  102257:	85 02                	test   %eax,(%edx)
  102259:	83 05 63 0e 18 44 0e 	addl   $0xe,0x44180e63
  102260:	1c 4a                	sbb    $0x4a,%al
  102262:	0e                   	push   %cs
  102263:	18 41 0e             	sbb    %al,0xe(%ecx)
  102266:	14 46                	adc    $0x46,%al
  102268:	0e                   	push   %cs
  102269:	18 45 0e             	sbb    %al,0xe(%ebp)
  10226c:	1c 46                	sbb    $0x46,%al
  10226e:	0e                   	push   %cs
  10226f:	18 41 0e             	sbb    %al,0xe(%ecx)
  102272:	14 47                	adc    $0x47,%al
  102274:	c3                   	ret
  102275:	44                   	inc    %esp
  102276:	c5 5b c6             	lds    -0x3a(%ebx),%ebx
  102279:	c7                   	(bad)
  10227a:	0e                   	push   %cs
  10227b:	04 28                	add    $0x28,%al
  10227d:	00 00                	add    %al,(%eax)
  10227f:	00 e8                	add    %ch,%al
  102281:	00 00                	add    %al,(%eax)
  102283:	00 8c e0 ff ff f1 00 	add    %cl,0xf1ffff(%eax,%eiz,8)
  10228a:	00 00                	add    %al,(%eax)
  10228c:	00 43 0e             	add    %al,0xe(%ebx)
  10228f:	18 51 83             	sbb    %dl,-0x7d(%ecx)
  102292:	05 53 85 02 67       	add    $0x67028553,%eax
  102297:	86 04 49             	xchg   %al,(%ecx,%ecx,2)
  10229a:	87 03                	xchg   %eax,(%ebx)
  10229c:	02 7c c6 44          	add    0x44(%esi,%eax,8),%bh
  1022a0:	c7                   	(bad)
  1022a1:	59                   	pop    %ecx
  1022a2:	c3                   	ret
  1022a3:	c5 0e                	lds    (%esi),%ecx
  1022a5:	04 00                	add    $0x0,%al
  1022a7:	00 28                	add    %ch,(%eax)
  1022a9:	00 00                	add    %al,(%eax)
  1022ab:	00 14 01             	add    %dl,(%ecx,%eax,1)
  1022ae:	00 00                	add    %al,(%eax)
  1022b0:	60                   	pusha
  1022b1:	e1 ff                	loope  1022b2 <kernel_main+0xae2>
  1022b3:	ff d0                	call   *%eax
  1022b5:	00 00                	add    %al,(%eax)
  1022b7:	00 00                	add    %al,(%eax)
  1022b9:	43                   	inc    %ebx
  1022ba:	0e                   	push   %cs
  1022bb:	18 4d 83             	sbb    %cl,-0x7d(%ebp)
  1022be:	05 69 86 04 4d       	add    $0x4d048669,%eax
  1022c3:	85 02                	test   %eax,(%edx)
  1022c5:	87 03                	xchg   %eax,(%ebx)
  1022c7:	02 7a c6             	add    -0x3a(%edx),%bh
  1022ca:	44                   	inc    %esp
  1022cb:	c7 44 c5 47 c3 0e 04 	movl   $0x40ec3,0x47(%ebp,%eax,8)
  1022d2:	00 
  1022d3:	00 10                	add    %dl,(%eax)
  1022d5:	00 00                	add    %al,(%eax)
  1022d7:	00 40 01             	add    %al,0x1(%eax)
  1022da:	00 00                	add    %al,(%eax)
  1022dc:	04 e2                	add    $0xe2,%al
  1022de:	ff                   	(bad)
  1022df:	ff 29                	ljmp   *(%ecx)
  1022e1:	00 00                	add    %al,(%eax)
  1022e3:	00 00                	add    %al,(%eax)
  1022e5:	00 00                	add    %al,(%eax)
  1022e7:	00 24 00             	add    %ah,(%eax,%eax,1)
  1022ea:	00 00                	add    %al,(%eax)
  1022ec:	54                   	push   %esp
  1022ed:	01 00                	add    %eax,(%eax)
  1022ef:	00 20                	add    %ah,(%eax)
  1022f1:	e2 ff                	loop   1022f2 <kernel_main+0xb22>
  1022f3:	ff a7 00 00 00 00    	jmp    *0x0(%edi)
  1022f9:	43                   	inc    %ebx
  1022fa:	0e                   	push   %cs
  1022fb:	14 5d                	adc    $0x5d,%al
  1022fd:	83 04 4d 87 02 86 03 	addl   $0x2,0x3860287(,%ecx,2)
  102304:	02 
  102305:	6e                   	outsb  %ds:(%esi),(%dx)
  102306:	c3                   	ret
  102307:	44                   	inc    %esp
  102308:	c6 44 c7 43 0e       	movb   $0xe,0x43(%edi,%eax,8)
  10230d:	04 00                	add    $0x0,%al
  10230f:	00 10                	add    %dl,(%eax)
  102311:	00 00                	add    %al,(%eax)
  102313:	00 7c 01 00          	add    %bh,0x0(%ecx,%eax,1)
  102317:	00 a8 e2 ff ff 1b    	add    %ch,0x1bffffe2(%eax)
  10231d:	00 00                	add    %al,(%eax)
  10231f:	00 00                	add    %al,(%eax)
  102321:	00 00                	add    %al,(%eax)
  102323:	00 10                	add    %dl,(%eax)
  102325:	00 00                	add    %al,(%eax)
  102327:	00 90 01 00 00 b4    	add    %dl,-0x4bffffff(%eax)
  10232d:	e2 ff                	loop   10232e <kernel_main+0xb5e>
  10232f:	ff                   	(bad)
  102330:	3a 00                	cmp    (%eax),%al
  102332:	00 00                	add    %al,(%eax)
  102334:	00 00                	add    %al,(%eax)
  102336:	00 00                	add    %al,(%eax)
  102338:	10 00                	adc    %al,(%eax)
  10233a:	00 00                	add    %al,(%eax)
  10233c:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  10233d:	01 00                	add    %eax,(%eax)
  10233f:	00 e0                	add    %ah,%al
  102341:	e2 ff                	loop   102342 <kernel_main+0xb72>
  102343:	ff 77 00             	push   0x0(%edi)
  102346:	00 00                	add    %al,(%eax)
  102348:	00 00                	add    %al,(%eax)
  10234a:	00 00                	add    %al,(%eax)
  10234c:	10 00                	adc    %al,(%eax)
  10234e:	00 00                	add    %al,(%eax)
  102350:	b8 01 00 00 4c       	mov    $0x4c000001,%eax
  102355:	e3 ff                	jecxz  102356 <kernel_main+0xb86>
  102357:	ff 17                	call   *(%edi)
  102359:	00 00                	add    %al,(%eax)
  10235b:	00 00                	add    %al,(%eax)
  10235d:	00 00                	add    %al,(%eax)
  10235f:	00 10                	add    %dl,(%eax)
  102361:	00 00                	add    %al,(%eax)
  102363:	00 cc                	add    %cl,%ah
  102365:	01 00                	add    %eax,(%eax)
  102367:	00 58 e3             	add    %bl,-0x1d(%eax)
  10236a:	ff                   	(bad)
  10236b:	ff 17                	call   *(%edi)
  10236d:	00 00                	add    %al,(%eax)
  10236f:	00 00                	add    %al,(%eax)
  102371:	00 00                	add    %al,(%eax)
  102373:	00 20                	add    %ah,(%eax)
  102375:	00 00                	add    %al,(%eax)
  102377:	00 e0                	add    %ah,%al
  102379:	01 00                	add    %eax,(%eax)
  10237b:	00 64 e3 ff          	add    %ah,-0x1(%ebx,%eiz,8)
  10237f:	ff 42 00             	incl   0x0(%edx)
  102382:	00 00                	add    %al,(%eax)
  102384:	00 41 0e             	add    %al,0xe(%ecx)
  102387:	08 83 02 73 0a c3    	or     %al,-0x3cf58cfe(%ebx)
  10238d:	0e                   	push   %cs
  10238e:	04 44                	add    $0x44,%al
  102390:	0b 46 c3             	or     -0x3d(%esi),%eax
  102393:	0e                   	push   %cs
  102394:	04 00                	add    $0x0,%al
  102396:	00 00                	add    %al,(%eax)
  102398:	10 00                	adc    %al,(%eax)
  10239a:	00 00                	add    %al,(%eax)
  10239c:	04 02                	add    $0x2,%al
  10239e:	00 00                	add    %al,(%eax)
  1023a0:	90                   	nop
  1023a1:	e3 ff                	jecxz  1023a2 <kernel_main+0xbd2>
  1023a3:	ff 21                	jmp    *(%ecx)
  1023a5:	00 00                	add    %al,(%eax)
  1023a7:	00 00                	add    %al,(%eax)
  1023a9:	00 00                	add    %al,(%eax)
  1023ab:	00 24 00             	add    %ah,(%eax,%eax,1)
  1023ae:	00 00                	add    %al,(%eax)
  1023b0:	18 02                	sbb    %al,(%edx)
  1023b2:	00 00                	add    %al,(%eax)
  1023b4:	ac                   	lods   %ds:(%esi),%al
  1023b5:	e3 ff                	jecxz  1023b6 <kernel_main+0xbe6>
  1023b7:	ff 59 00             	lcall  *0x0(%ecx)
  1023ba:	00 00                	add    %al,(%eax)
  1023bc:	00 41 0e             	add    %al,0xe(%ecx)
  1023bf:	08 86 02 41 0e 0c    	or     %al,0xc0e4102(%esi)
  1023c5:	83 03 02             	addl   $0x2,(%ebx)
  1023c8:	4c                   	dec    %esp
  1023c9:	0a c3                	or     %bl,%al
  1023cb:	0e                   	push   %cs
  1023cc:	08 41 c6             	or     %al,-0x3a(%ecx)
  1023cf:	0e                   	push   %cs
  1023d0:	04 41                	add    $0x41,%al
  1023d2:	0b 00                	or     (%eax),%eax
  1023d4:	2c 00                	sub    $0x0,%al
  1023d6:	00 00                	add    %al,(%eax)
  1023d8:	40                   	inc    %eax
  1023d9:	02 00                	add    (%eax),%al
  1023db:	00 e4                	add    %ah,%ah
  1023dd:	e3 ff                	jecxz  1023de <kernel_main+0xc0e>
  1023df:	ff                   	(bad)
  1023e0:	7c 00                	jl     1023e2 <kernel_main+0xc12>
  1023e2:	00 00                	add    %al,(%eax)
  1023e4:	00 41 0e             	add    %al,0xe(%ecx)
  1023e7:	08 87 02 41 0e 0c    	or     %al,0xc0e4102(%edi)
  1023ed:	86 03                	xchg   %al,(%ebx)
  1023ef:	41                   	inc    %ecx
  1023f0:	0e                   	push   %cs
  1023f1:	10 83 04 02 5d 0a    	adc    %al,0xa5d0204(%ebx)
  1023f7:	c3                   	ret
  1023f8:	0e                   	push   %cs
  1023f9:	0c 41                	or     $0x41,%al
  1023fb:	c6                   	(bad)
  1023fc:	0e                   	push   %cs
  1023fd:	08 41 c7             	or     %al,-0x39(%ecx)
  102400:	0e                   	push   %cs
  102401:	04 46                	add    $0x46,%al
  102403:	0b 10                	or     (%eax),%edx
  102405:	00 00                	add    %al,(%eax)
  102407:	00 70 02             	add    %dh,0x2(%eax)
  10240a:	00 00                	add    %al,(%eax)
  10240c:	34 e4                	xor    $0xe4,%al
  10240e:	ff                   	(bad)
  10240f:	ff 23                	jmp    *(%ebx)
  102411:	00 00                	add    %al,(%eax)
  102413:	00 00                	add    %al,(%eax)
  102415:	00 00                	add    %al,(%eax)
  102417:	00 10                	add    %dl,(%eax)
  102419:	00 00                	add    %al,(%eax)
  10241b:	00 84 02 00 00 50 e4 	add    %al,-0x1bb00000(%edx,%eax,1)
  102422:	ff                   	(bad)
  102423:	ff 0e                	decl   (%esi)
  102425:	00 00                	add    %al,(%eax)
  102427:	00 00                	add    %al,(%eax)
  102429:	00 00                	add    %al,(%eax)
  10242b:	00 10                	add    %dl,(%eax)
  10242d:	00 00                	add    %al,(%eax)
  10242f:	00 98 02 00 00 4c    	add    %bl,0x4c000002(%eax)
  102435:	e4 ff                	in     $0xff,%al
  102437:	ff 03                	incl   (%ebx)
  102439:	00 00                	add    %al,(%eax)
  10243b:	00 00                	add    %al,(%eax)
  10243d:	00 00                	add    %al,(%eax)
  10243f:	00 10                	add    %dl,(%eax)
  102441:	00 00                	add    %al,(%eax)
  102443:	00 ac 02 00 00 48 e4 	add    %ch,-0x1bb80000(%edx,%eax,1)
  10244a:	ff                   	(bad)
  10244b:	ff 21                	jmp    *(%ecx)
  10244d:	00 00                	add    %al,(%eax)
  10244f:	00 00                	add    %al,(%eax)
  102451:	00 00                	add    %al,(%eax)
  102453:	00 38                	add    %bh,(%eax)
  102455:	00 00                	add    %al,(%eax)
  102457:	00 c0                	add    %al,%al
  102459:	02 00                	add    (%eax),%al
  10245b:	00 64 e4 ff          	add    %ah,-0x1(%esp,%eiz,8)
  10245f:	ff e4                	jmp    *%esp
  102461:	00 00                	add    %al,(%eax)
  102463:	00 00                	add    %al,(%eax)
  102465:	41                   	inc    %ecx
  102466:	0e                   	push   %cs
  102467:	08 87 02 41 0e 0c    	or     %al,0xc0e4102(%edi)
  10246d:	86 03                	xchg   %al,(%ebx)
  10246f:	41                   	inc    %ecx
  102470:	0e                   	push   %cs
  102471:	10 83 04 02 b4 0e    	adc    %al,0xeb40204(%ebx)
  102477:	14 41                	adc    $0x41,%al
  102479:	0e                   	push   %cs
  10247a:	18 46 0e             	sbb    %al,0xe(%esi)
  10247d:	14 41                	adc    $0x41,%al
  10247f:	0e                   	push   %cs
  102480:	10 59 0a             	adc    %bl,0xa(%ecx)
  102483:	c3                   	ret
  102484:	0e                   	push   %cs
  102485:	0c 41                	or     $0x41,%al
  102487:	c6                   	(bad)
  102488:	0e                   	push   %cs
  102489:	08 41 c7             	or     %al,-0x39(%ecx)
  10248c:	0e                   	push   %cs
  10248d:	04 41                	add    $0x41,%al
  10248f:	0b 3c 00             	or     (%eax,%eax,1),%edi
  102492:	00 00                	add    %al,(%eax)
  102494:	fc                   	cld
  102495:	02 00                	add    (%eax),%al
  102497:	00 18                	add    %bl,(%eax)
  102499:	e5 ff                	in     $0xff,%eax
  10249b:	ff                   	(bad)
  10249c:	7d 00                	jge    10249e <kernel_main+0xcce>
  10249e:	00 00                	add    %al,(%eax)
  1024a0:	00 41 0e             	add    %al,0xe(%ecx)
  1024a3:	08 83 02 4d 0e 78    	or     %al,0x780e4d02(%ebx)
  1024a9:	44                   	inc    %esp
  1024aa:	0e                   	push   %cs
  1024ab:	7c 44                	jl     1024f1 <kernel_main+0xd21>
  1024ad:	0e                   	push   %cs
  1024ae:	80 01 46             	addb   $0x46,(%ecx)
  1024b1:	0e                   	push   %cs
  1024b2:	7c 44                	jl     1024f8 <kernel_main+0xd28>
  1024b4:	0e                   	push   %cs
  1024b5:	78 4d                	js     102504 <kernel_main+0xd34>
  1024b7:	0e                   	push   %cs
  1024b8:	7c 5b                	jl     102515 <kernel_main+0xd45>
  1024ba:	0e                   	push   %cs
  1024bb:	78 4a                	js     102507 <kernel_main+0xd37>
  1024bd:	0e                   	push   %cs
  1024be:	7c 44                	jl     102504 <kernel_main+0xd34>
  1024c0:	0e                   	push   %cs
  1024c1:	80 01 49             	addb   $0x49,(%ecx)
  1024c4:	0e                   	push   %cs
  1024c5:	7c 41                	jl     102508 <kernel_main+0xd38>
  1024c7:	0e                   	push   %cs
  1024c8:	78 57                	js     102521 <kernel_main+0xd51>
  1024ca:	0e                   	push   %cs
  1024cb:	08 41 c3             	or     %al,-0x3d(%ecx)
  1024ce:	0e                   	push   %cs
  1024cf:	04 10                	add    $0x10,%al
  1024d1:	00 00                	add    %al,(%eax)
  1024d3:	00 3c 03             	add    %bh,(%ebx,%eax,1)
  1024d6:	00 00                	add    %al,(%eax)
  1024d8:	58                   	pop    %eax
  1024d9:	e5 ff                	in     $0xff,%eax
  1024db:	ff 31                	push   (%ecx)
  1024dd:	00 00                	add    %al,(%eax)
  1024df:	00 00                	add    %al,(%eax)
  1024e1:	00 00                	add    %al,(%eax)
  1024e3:	00 10                	add    %dl,(%eax)
  1024e5:	00 00                	add    %al,(%eax)
  1024e7:	00 50 03             	add    %dl,0x3(%eax)
  1024ea:	00 00                	add    %al,(%eax)
  1024ec:	84 e5                	test   %ah,%ch
  1024ee:	ff                   	(bad)
  1024ef:	ff 43 00             	incl   0x0(%ebx)
  1024f2:	00 00                	add    %al,(%eax)
  1024f4:	00 00                	add    %al,(%eax)
  1024f6:	00 00                	add    %al,(%eax)
  1024f8:	10 00                	adc    %al,(%eax)
  1024fa:	00 00                	add    %al,(%eax)
  1024fc:	64 03 00             	add    %fs:(%eax),%eax
  1024ff:	00 c0                	add    %al,%al
  102501:	e5 ff                	in     $0xff,%eax
  102503:	ff 1e                	lcall  *(%esi)
  102505:	00 00                	add    %al,(%eax)
  102507:	00 00                	add    %al,(%eax)
  102509:	00 00                	add    %al,(%eax)
  10250b:	00 10                	add    %dl,(%eax)
  10250d:	00 00                	add    %al,(%eax)
  10250f:	00 78 03             	add    %bh,0x3(%eax)
  102512:	00 00                	add    %al,(%eax)
  102514:	cc                   	int3
  102515:	e5 ff                	in     $0xff,%eax
  102517:	ff 56 01             	call   *0x1(%esi)
  10251a:	00 00                	add    %al,(%eax)
  10251c:	00 00                	add    %al,(%eax)
  10251e:	00 00                	add    %al,(%eax)
  102520:	3c 00                	cmp    $0x0,%al
  102522:	00 00                	add    %al,(%eax)
  102524:	8c 03                	mov    %es,(%ebx)
  102526:	00 00                	add    %al,(%eax)
  102528:	18 e7                	sbb    %ah,%bh
  10252a:	ff                   	(bad)
  10252b:	ff 9f 01 00 00 00    	lcall  *0x1(%edi)
  102531:	61                   	popa
  102532:	0e                   	push   %cs
  102533:	08 85 02 41 0e 0c    	or     %al,0xc0e4102(%ebp)
  102539:	87 03                	xchg   %eax,(%ebx)
  10253b:	41                   	inc    %ecx
  10253c:	0e                   	push   %cs
  10253d:	10 86 04 41 0e 14    	adc    %al,0x140e4104(%esi)
  102543:	83 05 43 0e 18 02 f1 	addl   $0xfffffff1,0x2180e43
  10254a:	0a 0e                	or     (%esi),%cl
  10254c:	14 41                	adc    $0x41,%al
  10254e:	c3                   	ret
  10254f:	0e                   	push   %cs
  102550:	10 41 c6             	adc    %al,-0x3a(%ecx)
  102553:	0e                   	push   %cs
  102554:	0c 41                	or     $0x41,%al
  102556:	c7                   	(bad)
  102557:	0e                   	push   %cs
  102558:	08 41 c5             	or     %al,-0x3b(%ecx)
  10255b:	0e                   	push   %cs
  10255c:	04 44                	add    $0x44,%al
  10255e:	0b 00                	or     (%eax),%eax
  102560:	10 00                	adc    %al,(%eax)
  102562:	00 00                	add    %al,(%eax)
  102564:	cc                   	int3
  102565:	03 00                	add    (%eax),%eax
  102567:	00 78 e8             	add    %bh,-0x18(%eax)
  10256a:	ff                   	(bad)
  10256b:	ff 15 00 00 00 00    	call   *0x0
  102571:	00 00                	add    %al,(%eax)
  102573:	00 10                	add    %dl,(%eax)
  102575:	00 00                	add    %al,(%eax)
  102577:	00 e0                	add    %ah,%al
  102579:	03 00                	add    (%eax),%eax
  10257b:	00 84 e8 ff ff 27 00 	add    %al,0x27ffff(%eax,%ebp,8)
  102582:	00 00                	add    %al,(%eax)
  102584:	00 00                	add    %al,(%eax)
  102586:	00 00                	add    %al,(%eax)
  102588:	2c 00                	sub    $0x0,%al
  10258a:	00 00                	add    %al,(%eax)
  10258c:	f4                   	hlt
  10258d:	03 00                	add    (%eax),%eax
  10258f:	00 a0 e8 ff ff a6    	add    %ah,-0x59000018(%eax)
  102595:	00 00                	add    %al,(%eax)
  102597:	00 00                	add    %al,(%eax)
  102599:	41                   	inc    %ecx
  10259a:	0e                   	push   %cs
  10259b:	08 87 02 4e 0e 0c    	or     %al,0xc0e4e02(%edi)
  1025a1:	86 03                	xchg   %al,(%ebx)
  1025a3:	4e                   	dec    %esi
  1025a4:	0e                   	push   %cs
  1025a5:	10 83 04 02 86 c3    	adc    %al,-0x3c79fdfc(%ebx)
  1025ab:	0e                   	push   %cs
  1025ac:	0c 41                	or     $0x41,%al
  1025ae:	c6                   	(bad)
  1025af:	0e                   	push   %cs
  1025b0:	08 41 c7             	or     %al,-0x39(%ecx)
  1025b3:	0e                   	push   %cs
  1025b4:	04 00                	add    $0x0,%al
  1025b6:	00 00                	add    %al,(%eax)
  1025b8:	1c 00                	sbb    $0x0,%al
  1025ba:	00 00                	add    %al,(%eax)
  1025bc:	24 04                	and    $0x4,%al
  1025be:	00 00                	add    %al,(%eax)
  1025c0:	20 e9                	and    %ch,%cl
  1025c2:	ff                   	(bad)
  1025c3:	ff 77 00             	push   0x0(%edi)
  1025c6:	00 00                	add    %al,(%eax)
  1025c8:	00 45 0e             	add    %al,0xe(%ebp)
  1025cb:	08 42 0e             	or     %al,0xe(%edx)
  1025ce:	0c 42                	or     $0x42,%al
  1025d0:	0e                   	push   %cs
  1025d1:	10 4d 0e             	adc    %cl,0xe(%ebp)
  1025d4:	04 00                	add    $0x0,%al
  1025d6:	00 00                	add    %al,(%eax)
  1025d8:	58                   	pop    %eax
  1025d9:	00 00                	add    %al,(%eax)
  1025db:	00 44 04 00          	add    %al,0x0(%esp,%eax,1)
  1025df:	00 80 e9 ff ff 25    	add    %al,0x25ffffe9(%eax)
  1025e5:	03 00                	add    (%eax),%eax
  1025e7:	00 00                	add    %al,(%eax)
  1025e9:	41                   	inc    %ecx
  1025ea:	0e                   	push   %cs
  1025eb:	08 85 02 41 0e 0c    	or     %al,0xc0e4102(%ebp)
  1025f1:	87 03                	xchg   %eax,(%ebx)
  1025f3:	41                   	inc    %ecx
  1025f4:	0e                   	push   %cs
  1025f5:	10 86 04 41 0e 14    	adc    %al,0x140e4104(%esi)
  1025fb:	83 05 43 0e 34 03 1e 	addl   $0x1e,0x3340e43
  102602:	01 0e                	add    %ecx,(%esi)
  102604:	38 44 0e 3c          	cmp    %al,0x3c(%esi,%ecx,1)
  102608:	49                   	dec    %ecx
  102609:	0e                   	push   %cs
  10260a:	38 41 0e             	cmp    %al,0xe(%ecx)
  10260d:	34 03                	xor    $0x3,%al
  10260f:	8f 01                	pop    (%ecx)
  102611:	0e                   	push   %cs
  102612:	38 44 0e 3c          	cmp    %al,0x3c(%esi,%ecx,1)
  102616:	49                   	dec    %ecx
  102617:	0e                   	push   %cs
  102618:	38 41 0e             	cmp    %al,0xe(%ecx)
  10261b:	34 69                	xor    $0x69,%al
  10261d:	0a 0e                	or     (%esi),%cl
  10261f:	14 41                	adc    $0x41,%al
  102621:	c3                   	ret
  102622:	0e                   	push   %cs
  102623:	10 41 c6             	adc    %al,-0x3a(%ecx)
  102626:	0e                   	push   %cs
  102627:	0c 41                	or     $0x41,%al
  102629:	c7                   	(bad)
  10262a:	0e                   	push   %cs
  10262b:	08 41 c5             	or     %al,-0x3b(%ecx)
  10262e:	0e                   	push   %cs
  10262f:	04 41                	add    $0x41,%al
  102631:	0b 00                	or     (%eax),%eax
  102633:	00 2c 00             	add    %ch,(%eax,%eax,1)
  102636:	00 00                	add    %al,(%eax)
  102638:	a0 04 00 00 54       	mov    0x54000004,%al
  10263d:	ec                   	in     (%dx),%al
  10263e:	ff                   	(bad)
  10263f:	ff 80 00 00 00 00    	incl   0x0(%eax)
  102645:	46                   	inc    %esi
  102646:	0e                   	push   %cs
  102647:	08 86 02 41 0e 0c    	or     %al,0xc0e4102(%esi)
  10264d:	83 03 02             	addl   $0x2,(%ebx)
  102650:	69 0a c3 0e 08 41    	imul   $0x41080ec3,(%edx),%ecx
  102656:	c6                   	(bad)
  102657:	0e                   	push   %cs
  102658:	04 41                	add    $0x41,%al
  10265a:	0b 47 c3             	or     -0x3d(%edi),%eax
  10265d:	0e                   	push   %cs
  10265e:	08 41 c6             	or     %al,-0x3a(%ecx)
  102661:	0e                   	push   %cs
  102662:	04 00                	add    $0x0,%al
  102664:	20 00                	and    %al,(%eax)
  102666:	00 00                	add    %al,(%eax)
  102668:	d0 04 00             	rolb   $1,(%eax,%eax,1)
  10266b:	00 a4 ec ff ff 57 00 	add    %ah,0x57ffff(%esp,%ebp,8)
  102672:	00 00                	add    %al,(%eax)
  102674:	00 47 0e             	add    %al,0xe(%edi)
  102677:	08 83 02 02 41 0a    	or     %al,0xa410202(%ebx)
  10267d:	c3                   	ret
  10267e:	0e                   	push   %cs
  10267f:	04 48                	add    $0x48,%al
  102681:	0b 46 c3             	or     -0x3d(%esi),%eax
  102684:	0e                   	push   %cs
  102685:	04 00                	add    $0x0,%al
  102687:	00 70 00             	add    %dh,0x0(%eax)
  10268a:	00 00                	add    %al,(%eax)
  10268c:	f4                   	hlt
  10268d:	04 00                	add    $0x0,%al
  10268f:	00 e0                	add    %ah,%al
  102691:	ec                   	in     (%dx),%al
  102692:	ff                   	(bad)
  102693:	ff 94 00 00 00 00 41 	call   *0x41000000(%eax,%eax,1)
  10269a:	0e                   	push   %cs
  10269b:	08 85 02 41 0e 0c    	or     %al,0xc0e4102(%ebp)
  1026a1:	87 03                	xchg   %eax,(%ebx)
  1026a3:	41                   	inc    %ecx
  1026a4:	0e                   	push   %cs
  1026a5:	10 86 04 41 0e 14    	adc    %al,0x140e4104(%esi)
  1026ab:	83 05 46 0e d0 09 4c 	addl   $0x4c,0x9d00e46
  1026b2:	0e                   	push   %cs
  1026b3:	d4 09                	aam    $0x9
  1026b5:	45                   	inc    %ebp
  1026b6:	0e                   	push   %cs
  1026b7:	d8 09                	fmuls  (%ecx)
  1026b9:	4d                   	dec    %ebp
  1026ba:	0e                   	push   %cs
  1026bb:	dc 09                	fmull  (%ecx)
  1026bd:	41                   	inc    %ecx
  1026be:	0e                   	push   %cs
  1026bf:	e0 09                	loopne 1026ca <kernel_main+0xefa>
  1026c1:	4d                   	dec    %ebp
  1026c2:	0e                   	push   %cs
  1026c3:	d0 09                	rorb   $1,(%ecx)
  1026c5:	5d                   	pop    %ebp
  1026c6:	0e                   	push   %cs
  1026c7:	d4 09                	aam    $0x9
  1026c9:	4b                   	dec    %ebx
  1026ca:	0e                   	push   %cs
  1026cb:	d8 09                	fmuls  (%ecx)
  1026cd:	41                   	inc    %ecx
  1026ce:	0e                   	push   %cs
  1026cf:	dc 09                	fmull  (%ecx)
  1026d1:	41                   	inc    %ecx
  1026d2:	0e                   	push   %cs
  1026d3:	e0 09                	loopne 1026de <kernel_main+0xf0e>
  1026d5:	4a                   	dec    %edx
  1026d6:	0e                   	push   %cs
  1026d7:	d0 09                	rorb   $1,(%ecx)
  1026d9:	4d                   	dec    %ebp
  1026da:	0e                   	push   %cs
  1026db:	d4 09                	aam    $0x9
  1026dd:	45                   	inc    %ebp
  1026de:	0e                   	push   %cs
  1026df:	d8 09                	fmuls  (%ecx)
  1026e1:	41                   	inc    %ecx
  1026e2:	0e                   	push   %cs
  1026e3:	dc 09                	fmull  (%ecx)
  1026e5:	47                   	inc    %edi
  1026e6:	0e                   	push   %cs
  1026e7:	e0 09                	loopne 1026f2 <kernel_main+0xf22>
  1026e9:	4b                   	dec    %ebx
  1026ea:	0e                   	push   %cs
  1026eb:	14 41                	adc    $0x41,%al
  1026ed:	c3                   	ret
  1026ee:	0e                   	push   %cs
  1026ef:	10 41 c6             	adc    %al,-0x3a(%ecx)
  1026f2:	0e                   	push   %cs
  1026f3:	0c 41                	or     $0x41,%al
  1026f5:	c7                   	(bad)
  1026f6:	0e                   	push   %cs
  1026f7:	08 41 c5             	or     %al,-0x3b(%ecx)
  1026fa:	0e                   	push   %cs
  1026fb:	04 1c                	add    $0x1c,%al
  1026fd:	00 00                	add    %al,(%eax)
  1026ff:	00 68 05             	add    %ch,0x5(%eax)
  102702:	00 00                	add    %al,(%eax)
  102704:	0c ed                	or     $0xed,%al
  102706:	ff                   	(bad)
  102707:	ff 21                	jmp    *(%ecx)
  102709:	00 00                	add    %al,(%eax)
  10270b:	00 00                	add    %al,(%eax)
  10270d:	4f                   	dec    %edi
  10270e:	0e                   	push   %cs
  10270f:	08 42 0e             	or     %al,0xe(%edx)
  102712:	0c 42                	or     $0x42,%al
  102714:	0e                   	push   %cs
  102715:	10 45 0e             	adc    %al,0xe(%ebp)
  102718:	14 48                	adc    $0x48,%al
  10271a:	0e                   	push   %cs
  10271b:	04 28                	add    $0x28,%al
  10271d:	00 00                	add    %al,(%eax)
  10271f:	00 88 05 00 00 1c    	add    %cl,0x1c000005(%eax)
  102725:	ed                   	in     (%dx),%eax
  102726:	ff                   	(bad)
  102727:	ff 43 00             	incl   0x0(%ebx)
  10272a:	00 00                	add    %al,(%eax)
  10272c:	00 43 0e             	add    %al,0xe(%ebx)
  10272f:	10 44 87 02          	adc    %al,0x2(%edi,%eax,4)
  102733:	4d                   	dec    %ebp
  102734:	83 04 46 86          	addl   $0xffffff86,(%esi,%eax,2)
  102738:	03 47 0e             	add    0xe(%edi),%eax
  10273b:	14 4f                	adc    $0x4f,%al
  10273d:	0e                   	push   %cs
  10273e:	10 47 c3             	adc    %al,-0x3d(%edi)
  102741:	44                   	inc    %esp
  102742:	c6 47 c7 0e          	movb   $0xe,-0x39(%edi)
  102746:	04 00                	add    $0x0,%al
  102748:	30 00                	xor    %al,(%eax)
  10274a:	00 00                	add    %al,(%eax)
  10274c:	b4 05                	mov    $0x5,%ah
  10274e:	00 00                	add    %al,(%eax)
  102750:	40                   	inc    %eax
  102751:	ed                   	in     (%dx),%eax
  102752:	ff                   	(bad)
  102753:	ff a3 00 00 00 00    	jmp    *0x0(%ebx)
  102759:	43                   	inc    %ebx
  10275a:	0e                   	push   %cs
  10275b:	14 44                	adc    $0x44,%al
  10275d:	87 03                	xchg   %eax,(%ebx)
  10275f:	5a                   	pop    %edx
  102760:	86 04 85 02 83 05 02 	xchg   %al,0x2058302(,%eax,4)
  102767:	4a                   	dec    %edx
  102768:	c3                   	ret
  102769:	44                   	inc    %esp
  10276a:	c6 44 c5 47 c7       	movb   $0xc7,0x47(%ebp,%eax,8)
  10276f:	0e                   	push   %cs
  102770:	04 41                	add    $0x41,%al
  102772:	0e                   	push   %cs
  102773:	14 83                	adc    $0x83,%al
  102775:	05 85 02 86 04       	add    $0x4860285,%eax
  10277a:	87 03                	xchg   %eax,(%ebx)
  10277c:	20 00                	and    %al,(%eax)
  10277e:	00 00                	add    %al,(%eax)
  102780:	e8 05 00 00 bc       	call   bc10278a <cursor+0xbbfec80e>
  102785:	ed                   	in     (%dx),%eax
  102786:	ff                   	(bad)
  102787:	ff 55 00             	call   *0x0(%ebp)
  10278a:	00 00                	add    %al,(%eax)
  10278c:	00 41 0e             	add    %al,0xe(%ecx)
  10278f:	08 86 02 41 0e 0c    	or     %al,0xc0e4102(%esi)
  102795:	83 03 02             	addl   $0x2,(%ebx)
  102798:	51                   	push   %ecx
  102799:	c3                   	ret
  10279a:	0e                   	push   %cs
  10279b:	08 41 c6             	or     %al,-0x3a(%ecx)
  10279e:	0e                   	push   %cs
  10279f:	04 10                	add    $0x10,%al
  1027a1:	00 00                	add    %al,(%eax)
  1027a3:	00 0c 06             	add    %cl,(%esi,%eax,1)
  1027a6:	00 00                	add    %al,(%eax)
  1027a8:	f8                   	clc
  1027a9:	ed                   	in     (%dx),%eax
  1027aa:	ff                   	(bad)
  1027ab:	ff                   	(bad)
  1027ac:	3a 00                	cmp    (%eax),%al
  1027ae:	00 00                	add    %al,(%eax)
  1027b0:	00 00                	add    %al,(%eax)
  1027b2:	00 00                	add    %al,(%eax)
  1027b4:	10 00                	adc    %al,(%eax)
  1027b6:	00 00                	add    %al,(%eax)
  1027b8:	20 06                	and    %al,(%esi)
  1027ba:	00 00                	add    %al,(%eax)
  1027bc:	24 ee                	and    $0xee,%al
  1027be:	ff                   	(bad)
  1027bf:	ff 29                	ljmp   *(%ecx)
  1027c1:	00 00                	add    %al,(%eax)
  1027c3:	00 00                	add    %al,(%eax)
  1027c5:	00 00                	add    %al,(%eax)
  1027c7:	00 3c 00             	add    %bh,(%eax,%eax,1)
  1027ca:	00 00                	add    %al,(%eax)
  1027cc:	34 06                	xor    $0x6,%al
  1027ce:	00 00                	add    %al,(%eax)
  1027d0:	40                   	inc    %eax
  1027d1:	ee                   	out    %al,(%dx)
  1027d2:	ff                   	(bad)
  1027d3:	ff 9f 00 00 00 00    	lcall  *0x0(%edi)
  1027d9:	43                   	inc    %ebx
  1027da:	0e                   	push   %cs
  1027db:	14 44                	adc    $0x44,%al
  1027dd:	87 03                	xchg   %eax,(%ebx)
  1027df:	4a                   	dec    %edx
  1027e0:	85 02                	test   %eax,(%edx)
  1027e2:	4f                   	dec    %edi
  1027e3:	83 05 86 04 02 4b c3 	addl   $0xffffffc3,0x4b020486
  1027ea:	44                   	inc    %esp
  1027eb:	c6                   	(bad)
  1027ec:	4d                   	dec    %ebp
  1027ed:	c7 c5 0e 04 44 0e    	mov    $0xe44040e,%ebp
  1027f3:	14 83                	adc    $0x83,%al
  1027f5:	05 85 02 86 04       	add    $0x4860285,%eax
  1027fa:	87 03                	xchg   %eax,(%ebx)
  1027fc:	4f                   	dec    %edi
  1027fd:	c3                   	ret
  1027fe:	44                   	inc    %esp
  1027ff:	c6                   	(bad)
  102800:	4b                   	dec    %ebx
  102801:	c7 c5 0e 04 00 00    	mov    $0x40e,%ebp
  102807:	00 44 00 00          	add    %al,0x0(%eax,%eax,1)
  10280b:	00 74 06 00          	add    %dh,0x0(%esi,%eax,1)
  10280f:	00 a0 ee ff ff d1    	add    %ah,-0x2e000012(%eax)
  102815:	00 00                	add    %al,(%eax)
  102817:	00 00                	add    %al,(%eax)
  102819:	43                   	inc    %ebx
  10281a:	0e                   	push   %cs
  10281b:	30 4f 0a             	xor    %cl,0xa(%edi)
  10281e:	0e                   	push   %cs
  10281f:	04 46                	add    $0x46,%al
  102821:	0b 44 87 03          	or     0x3(%edi,%eax,4),%eax
  102825:	5a                   	pop    %edx
  102826:	83 05 85 02 46 86 04 	addl   $0x4,0x86460285
  10282d:	02 40 c3             	add    -0x3d(%eax),%al
  102830:	44                   	inc    %esp
  102831:	c6 44 c5 44 c7       	movb   $0xc7,0x44(%ebp,%eax,8)
  102836:	53                   	push   %ebx
  102837:	0e                   	push   %cs
  102838:	04 45                	add    $0x45,%al
  10283a:	0e                   	push   %cs
  10283b:	30 83 05 85 02 86    	xor    %al,-0x79fd7afb(%ebx)
  102841:	04 87                	add    $0x87,%al
  102843:	03 51 c3             	add    -0x3d(%ecx),%edx
  102846:	44                   	inc    %esp
  102847:	c7                   	(bad)
  102848:	48                   	dec    %eax
  102849:	c5 4f c6             	lds    -0x3a(%edi),%ecx
  10284c:	43                   	inc    %ebx
  10284d:	0e                   	push   %cs
  10284e:	04 00                	add    $0x0,%al
  102850:	1c 00                	sbb    $0x0,%al
  102852:	00 00                	add    %al,(%eax)
  102854:	bc 06 00 00 38       	mov    $0x38000006,%esp
  102859:	ef                   	out    %eax,(%dx)
  10285a:	ff                   	(bad)
  10285b:	ff 32                	push   (%edx)
  10285d:	00 00                	add    %al,(%eax)
  10285f:	00 00                	add    %al,(%eax)
  102861:	43                   	inc    %ebx
  102862:	0e                   	push   %cs
  102863:	0c 4b                	or     $0x4b,%al
  102865:	86 03                	xchg   %al,(%ebx)
  102867:	4c                   	dec    %esp
  102868:	87 02                	xchg   %eax,(%edx)
  10286a:	4f                   	dec    %edi
  10286b:	c7                   	(bad)
  10286c:	48                   	dec    %eax
  10286d:	c6                   	(bad)
  10286e:	0e                   	push   %cs
  10286f:	04 a0                	add    $0xa0,%al
  102871:	01 00                	add    %eax,(%eax)
  102873:	00 dc                	add    %bl,%ah
  102875:	06                   	push   %es
  102876:	00 00                	add    %al,(%eax)
  102878:	58                   	pop    %eax
  102879:	ef                   	out    %eax,(%dx)
  10287a:	ff                   	(bad)
  10287b:	ff 5d 07             	lcall  *0x7(%ebp)
  10287e:	00 00                	add    %al,(%eax)
  102880:	00 41 0e             	add    %al,0xe(%ecx)
  102883:	08 85 02 46 0e 0c    	or     %al,0xc0e4602(%ebp)
  102889:	87 03                	xchg   %eax,(%ebx)
  10288b:	41                   	inc    %ecx
  10288c:	0e                   	push   %cs
  10288d:	10 86 04 41 0e 14    	adc    %al,0x140e4104(%esi)
  102893:	83 05 43 0e 50 5d 0e 	addl   $0xe,0x5d500e43
  10289a:	54                   	push   %esp
  10289b:	45                   	inc    %ebp
  10289c:	0e                   	push   %cs
  10289d:	58                   	pop    %eax
  10289e:	4c                   	dec    %esp
  10289f:	0e                   	push   %cs
  1028a0:	5c                   	pop    %esp
  1028a1:	45                   	inc    %ebp
  1028a2:	0e                   	push   %cs
  1028a3:	60                   	pusha
  1028a4:	4d                   	dec    %ebp
  1028a5:	0e                   	push   %cs
  1028a6:	50                   	push   %eax
  1028a7:	02 95 0e 54 4a 0e    	add    0xe4a540e(%ebp),%dl
  1028ad:	58                   	pop    %eax
  1028ae:	6d                   	insl   (%dx),%es:(%edi)
  1028af:	0e                   	push   %cs
  1028b0:	54                   	push   %esp
  1028b1:	41                   	inc    %ecx
  1028b2:	0e                   	push   %cs
  1028b3:	50                   	push   %eax
  1028b4:	02 bc 0e 54 47 0e 58 	add    0x580e4754(%esi,%ecx,1),%bh
  1028bb:	02 42 0e             	add    0xe(%edx),%al
  1028be:	54                   	push   %esp
  1028bf:	41                   	inc    %ecx
  1028c0:	0e                   	push   %cs
  1028c1:	50                   	push   %eax
  1028c2:	02 b9 0e 54 4f 0e    	add    0xe4f540e(%ecx),%bh
  1028c8:	50                   	push   %eax
  1028c9:	4e                   	dec    %esi
  1028ca:	0e                   	push   %cs
  1028cb:	54                   	push   %esp
  1028cc:	42                   	inc    %edx
  1028cd:	0e                   	push   %cs
  1028ce:	58                   	pop    %eax
  1028cf:	42                   	inc    %edx
  1028d0:	0e                   	push   %cs
  1028d1:	5c                   	pop    %esp
  1028d2:	45                   	inc    %ebp
  1028d3:	0e                   	push   %cs
  1028d4:	60                   	pusha
  1028d5:	48                   	dec    %eax
  1028d6:	0e                   	push   %cs
  1028d7:	50                   	push   %eax
  1028d8:	02 70 0e             	add    0xe(%eax),%dh
  1028db:	5c                   	pop    %esp
  1028dc:	45                   	inc    %ebp
  1028dd:	0e                   	push   %cs
  1028de:	60                   	pusha
  1028df:	48                   	dec    %eax
  1028e0:	0e                   	push   %cs
  1028e1:	50                   	push   %eax
  1028e2:	6a 0e                	push   $0xe
  1028e4:	54                   	push   %esp
  1028e5:	41                   	inc    %ecx
  1028e6:	0e                   	push   %cs
  1028e7:	58                   	pop    %eax
  1028e8:	46                   	inc    %esi
  1028e9:	0e                   	push   %cs
  1028ea:	54                   	push   %esp
  1028eb:	41                   	inc    %ecx
  1028ec:	0e                   	push   %cs
  1028ed:	50                   	push   %eax
  1028ee:	02 59 0e             	add    0xe(%ecx),%bl
  1028f1:	5c                   	pop    %esp
  1028f2:	46                   	inc    %esi
  1028f3:	0e                   	push   %cs
  1028f4:	60                   	pusha
  1028f5:	65 0e                	gs push %cs
  1028f7:	50                   	push   %eax
  1028f8:	02 b3 0e 54 45 0e    	add    0xe45540e(%ebx),%dh
  1028fe:	58                   	pop    %eax
  1028ff:	42                   	inc    %edx
  102900:	0e                   	push   %cs
  102901:	5c                   	pop    %esp
  102902:	45                   	inc    %ebp
  102903:	0e                   	push   %cs
  102904:	60                   	pusha
  102905:	4c                   	dec    %esp
  102906:	0e                   	push   %cs
  102907:	5c                   	pop    %esp
  102908:	41                   	inc    %ecx
  102909:	0e                   	push   %cs
  10290a:	58                   	pop    %eax
  10290b:	45                   	inc    %ebp
  10290c:	0e                   	push   %cs
  10290d:	5c                   	pop    %esp
  10290e:	41                   	inc    %ecx
  10290f:	0e                   	push   %cs
  102910:	60                   	pusha
  102911:	48                   	dec    %eax
  102912:	0e                   	push   %cs
  102913:	50                   	push   %eax
  102914:	45                   	inc    %ebp
  102915:	0e                   	push   %cs
  102916:	54                   	push   %esp
  102917:	41                   	inc    %ecx
  102918:	0e                   	push   %cs
  102919:	58                   	pop    %eax
  10291a:	42                   	inc    %edx
  10291b:	0e                   	push   %cs
  10291c:	5c                   	pop    %esp
  10291d:	45                   	inc    %ebp
  10291e:	0e                   	push   %cs
  10291f:	60                   	pusha
  102920:	48                   	dec    %eax
  102921:	0e                   	push   %cs
  102922:	50                   	push   %eax
  102923:	02 47 0e             	add    0xe(%edi),%al
  102926:	54                   	push   %esp
  102927:	41                   	inc    %ecx
  102928:	0e                   	push   %cs
  102929:	58                   	pop    %eax
  10292a:	45                   	inc    %ebp
  10292b:	0e                   	push   %cs
  10292c:	5c                   	pop    %esp
  10292d:	41                   	inc    %ecx
  10292e:	0e                   	push   %cs
  10292f:	60                   	pusha
  102930:	48                   	dec    %eax
  102931:	0e                   	push   %cs
  102932:	50                   	push   %eax
  102933:	45                   	inc    %ebp
  102934:	0e                   	push   %cs
  102935:	54                   	push   %esp
  102936:	41                   	inc    %ecx
  102937:	0e                   	push   %cs
  102938:	58                   	pop    %eax
  102939:	42                   	inc    %edx
  10293a:	0e                   	push   %cs
  10293b:	5c                   	pop    %esp
  10293c:	45                   	inc    %ebp
  10293d:	0e                   	push   %cs
  10293e:	60                   	pusha
  10293f:	48                   	dec    %eax
  102940:	0e                   	push   %cs
  102941:	50                   	push   %eax
  102942:	59                   	pop    %ecx
  102943:	0e                   	push   %cs
  102944:	54                   	push   %esp
  102945:	41                   	inc    %ecx
  102946:	0e                   	push   %cs
  102947:	58                   	pop    %eax
  102948:	45                   	inc    %ebp
  102949:	0e                   	push   %cs
  10294a:	5c                   	pop    %esp
  10294b:	41                   	inc    %ecx
  10294c:	0e                   	push   %cs
  10294d:	60                   	pusha
  10294e:	48                   	dec    %eax
  10294f:	0e                   	push   %cs
  102950:	50                   	push   %eax
  102951:	4f                   	dec    %edi
  102952:	0e                   	push   %cs
  102953:	54                   	push   %esp
  102954:	41                   	inc    %ecx
  102955:	0e                   	push   %cs
  102956:	58                   	pop    %eax
  102957:	45                   	inc    %ebp
  102958:	0e                   	push   %cs
  102959:	5c                   	pop    %esp
  10295a:	41                   	inc    %ecx
  10295b:	0e                   	push   %cs
  10295c:	60                   	pusha
  10295d:	48                   	dec    %eax
  10295e:	0e                   	push   %cs
  10295f:	50                   	push   %eax
  102960:	45                   	inc    %ebp
  102961:	0e                   	push   %cs
  102962:	54                   	push   %esp
  102963:	41                   	inc    %ecx
  102964:	0e                   	push   %cs
  102965:	58                   	pop    %eax
  102966:	45                   	inc    %ebp
  102967:	0e                   	push   %cs
  102968:	5c                   	pop    %esp
  102969:	41                   	inc    %ecx
  10296a:	0e                   	push   %cs
  10296b:	60                   	pusha
  10296c:	48                   	dec    %eax
  10296d:	0e                   	push   %cs
  10296e:	50                   	push   %eax
  10296f:	75 0e                	jne    10297f <kernel_main+0x11af>
  102971:	54                   	push   %esp
  102972:	41                   	inc    %ecx
  102973:	0e                   	push   %cs
  102974:	58                   	pop    %eax
  102975:	45                   	inc    %ebp
  102976:	0e                   	push   %cs
  102977:	5c                   	pop    %esp
  102978:	45                   	inc    %ebp
  102979:	0e                   	push   %cs
  10297a:	60                   	pusha
  10297b:	48                   	dec    %eax
  10297c:	0e                   	push   %cs
  10297d:	50                   	push   %eax
  10297e:	64 0e                	fs push %cs
  102980:	54                   	push   %esp
  102981:	44                   	inc    %esp
  102982:	0e                   	push   %cs
  102983:	58                   	pop    %eax
  102984:	42                   	inc    %edx
  102985:	0e                   	push   %cs
  102986:	5c                   	pop    %esp
  102987:	42                   	inc    %edx
  102988:	0e                   	push   %cs
  102989:	60                   	pusha
  10298a:	48                   	dec    %eax
  10298b:	0e                   	push   %cs
  10298c:	50                   	push   %eax
  10298d:	46                   	inc    %esi
  10298e:	0e                   	push   %cs
  10298f:	54                   	push   %esp
  102990:	41                   	inc    %ecx
  102991:	0e                   	push   %cs
  102992:	58                   	pop    %eax
  102993:	45                   	inc    %ebp
  102994:	0e                   	push   %cs
  102995:	5c                   	pop    %esp
  102996:	41                   	inc    %ecx
  102997:	0e                   	push   %cs
  102998:	60                   	pusha
  102999:	48                   	dec    %eax
  10299a:	0e                   	push   %cs
  10299b:	50                   	push   %eax
  10299c:	45                   	inc    %ebp
  10299d:	0e                   	push   %cs
  10299e:	54                   	push   %esp
  10299f:	41                   	inc    %ecx
  1029a0:	0e                   	push   %cs
  1029a1:	58                   	pop    %eax
  1029a2:	45                   	inc    %ebp
  1029a3:	0e                   	push   %cs
  1029a4:	5c                   	pop    %esp
  1029a5:	41                   	inc    %ecx
  1029a6:	0e                   	push   %cs
  1029a7:	60                   	pusha
  1029a8:	48                   	dec    %eax
  1029a9:	0e                   	push   %cs
  1029aa:	50                   	push   %eax
  1029ab:	45                   	inc    %ebp
  1029ac:	0e                   	push   %cs
  1029ad:	54                   	push   %esp
  1029ae:	41                   	inc    %ecx
  1029af:	0e                   	push   %cs
  1029b0:	58                   	pop    %eax
  1029b1:	45                   	inc    %ebp
  1029b2:	0e                   	push   %cs
  1029b3:	5c                   	pop    %esp
  1029b4:	44                   	inc    %esp
  1029b5:	0e                   	push   %cs
  1029b6:	60                   	pusha
  1029b7:	48                   	dec    %eax
  1029b8:	0e                   	push   %cs
  1029b9:	50                   	push   %eax
  1029ba:	46                   	inc    %esi
  1029bb:	0e                   	push   %cs
  1029bc:	54                   	push   %esp
  1029bd:	41                   	inc    %ecx
  1029be:	0e                   	push   %cs
  1029bf:	58                   	pop    %eax
  1029c0:	42                   	inc    %edx
  1029c1:	0e                   	push   %cs
  1029c2:	5c                   	pop    %esp
  1029c3:	45                   	inc    %ebp
  1029c4:	0e                   	push   %cs
  1029c5:	60                   	pusha
  1029c6:	48                   	dec    %eax
  1029c7:	0e                   	push   %cs
  1029c8:	50                   	push   %eax
  1029c9:	43                   	inc    %ebx
  1029ca:	0e                   	push   %cs
  1029cb:	54                   	push   %esp
  1029cc:	41                   	inc    %ecx
  1029cd:	0e                   	push   %cs
  1029ce:	58                   	pop    %eax
  1029cf:	42                   	inc    %edx
  1029d0:	0e                   	push   %cs
  1029d1:	5c                   	pop    %esp
  1029d2:	47                   	inc    %edi
  1029d3:	0e                   	push   %cs
  1029d4:	60                   	pusha
  1029d5:	4b                   	dec    %ebx
  1029d6:	0e                   	push   %cs
  1029d7:	50                   	push   %eax
  1029d8:	5f                   	pop    %edi
  1029d9:	0e                   	push   %cs
  1029da:	54                   	push   %esp
  1029db:	41                   	inc    %ecx
  1029dc:	0e                   	push   %cs
  1029dd:	58                   	pop    %eax
  1029de:	45                   	inc    %ebp
  1029df:	0e                   	push   %cs
  1029e0:	5c                   	pop    %esp
  1029e1:	41                   	inc    %ecx
  1029e2:	0e                   	push   %cs
  1029e3:	60                   	pusha
  1029e4:	48                   	dec    %eax
  1029e5:	0e                   	push   %cs
  1029e6:	50                   	push   %eax
  1029e7:	4f                   	dec    %edi
  1029e8:	0e                   	push   %cs
  1029e9:	54                   	push   %esp
  1029ea:	41                   	inc    %ecx
  1029eb:	0e                   	push   %cs
  1029ec:	58                   	pop    %eax
  1029ed:	45                   	inc    %ebp
  1029ee:	0e                   	push   %cs
  1029ef:	5c                   	pop    %esp
  1029f0:	41                   	inc    %ecx
  1029f1:	0e                   	push   %cs
  1029f2:	60                   	pusha
  1029f3:	48                   	dec    %eax
  1029f4:	0e                   	push   %cs
  1029f5:	50                   	push   %eax
  1029f6:	45                   	inc    %ebp
  1029f7:	0e                   	push   %cs
  1029f8:	54                   	push   %esp
  1029f9:	41                   	inc    %ecx
  1029fa:	0e                   	push   %cs
  1029fb:	58                   	pop    %eax
  1029fc:	42                   	inc    %edx
  1029fd:	0e                   	push   %cs
  1029fe:	5c                   	pop    %esp
  1029ff:	45                   	inc    %ebp
  102a00:	0e                   	push   %cs
  102a01:	60                   	pusha
  102a02:	48                   	dec    %eax
  102a03:	0e                   	push   %cs
  102a04:	50                   	push   %eax
  102a05:	50                   	push   %eax
  102a06:	0e                   	push   %cs
  102a07:	54                   	push   %esp
  102a08:	41                   	inc    %ecx
  102a09:	0e                   	push   %cs
  102a0a:	58                   	pop    %eax
  102a0b:	42                   	inc    %edx
  102a0c:	0e                   	push   %cs
  102a0d:	5c                   	pop    %esp
  102a0e:	45                   	inc    %ebp
  102a0f:	0e                   	push   %cs
  102a10:	60                   	pusha
  102a11:	48                   	dec    %eax
  102a12:	0e                   	push   %cs
  102a13:	50                   	push   %eax

Дизассемблирование раздела .data:

00102a20 <SOD>:
  102a20:	19 00                	sbb    %eax,(%eax)
  102a22:	00 00                	add    %al,(%eax)
  102a24:	08 00                	or     %al,(%eax)
  102a26:	00 00                	add    %al,(%eax)
  102a28:	1f                   	pop    %ds
  102a29:	00 00                	add    %al,(%eax)
  102a2b:	00 08                	add    %cl,(%eax)
	...
  102e65:	00 00                	add    %al,(%eax)
  102e67:	00 46 41             	add    %al,0x41(%esi)
  102e6a:	54                   	push   %esp
  102e6b:	41                   	inc    %ecx
  102e6c:	4c                   	dec    %esp
  102e6d:	20 45 52             	and    %al,0x52(%ebp)
  102e70:	52                   	push   %edx
  102e71:	4f                   	dec    %edi
  102e72:	52                   	push   %edx
	...

00102ed0 <active_window>:
  102ed0:	ff                   	(bad)
  102ed1:	ff                   	(bad)
  102ed2:	ff                   	(bad)
  102ed3:	ff         	call   *0xc075bcd

00102ed4 <seed>:
  102ed4:	15 cd 5b 07        	adc    $0xc075bcd,%eax

00102ed8 <mousey>:
  102ed8:	0c 00                	or     $0x0,%al
	...

00102edc <mousex>:
  102edc:	28 00                	sub    %al,(%eax)
	...

00102ee0 <scancode_table>:
  102ee0:	00 1b                	add    %bl,(%ebx)
  102ee2:	31 32                	xor    %esi,(%edx)
  102ee4:	33 34 35 36 37 38 39 	xor    0x39383736(,%esi,1),%esi
  102eeb:	30 2d 3d 08 09 71    	xor    %ch,0x7109083d
  102ef1:	77 65                	ja     102f58 <scancode_table+0x78>
  102ef3:	72 74                	jb     102f69 <vga+0x9>
  102ef5:	79 75                	jns    102f6c <vga+0xc>
  102ef7:	69 6f 70 5b 5d 0a 00 	imul   $0xa5d5b,0x70(%edi),%ebp
  102efe:	61                   	popa
  102eff:	73 64                	jae    102f65 <vga+0x5>
  102f01:	66 67 68 6a 6b       	addr16 pushw $0x6b6a
  102f06:	6c                   	insb   (%dx),%es:(%edi)
  102f07:	3b 27                	cmp    (%edi),%esp
  102f09:	60                   	pusha
  102f0a:	00 5c 7a 78          	add    %bl,0x78(%edx,%edi,2)
  102f0e:	63 76 62             	arpl   %esi,0x62(%esi)
  102f11:	6e                   	outsb  %ds:(%esi),(%dx)
  102f12:	6d                   	insl   (%dx),%es:(%edi)
  102f13:	2c 2e                	sub    $0x2e,%al
  102f15:	2f                   	das
  102f16:	00 2a                	add    %ch,(%edx)
  102f18:	00 20                	add    %ah,(%eax)
	...

00102f60 <vga>:
  102f60:	00                   	.byte 0
  102f61:	80 0b 00             	orb    $0x0,(%ebx)

Дизассемблирование раздела .comment:

00000000 <.comment>:
   0:	47                   	inc    %edi
   1:	43                   	inc    %ebx
   2:	43                   	inc    %ebx
   3:	3a 20                	cmp    (%eax),%ah
   5:	28 47 4e             	sub    %al,0x4e(%edi)
   8:	55                   	push   %ebp
   9:	29 20                	sub    %esp,(%eax)
   b:	31 36                	xor    %esi,(%esi)
   d:	2e 31 2e             	xor    %ebp,%cs:(%esi)
  10:	31 20                	xor    %esp,(%eax)
  12:	32 30                	xor    (%eax),%dh
  14:	32 36                	xor    (%esi),%dh
  16:	30 34 33             	xor    %dh,(%ebx,%esi,1)
  19:	30 00                	xor    %al,(%eax)
