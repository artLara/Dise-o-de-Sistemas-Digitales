
--  CYPRESS NOVA XVL Structural Architecture

--  JED2VHD Reverse Assembler - 6.3 IR 35


--    VHDL File: p1.vhd

--    Date: Sun Feb 10 18:38:13 2019

--  Disassembly from Jedec file for: c22v10

--  Device Ordercode is: PALC22V10D-15PC
library ieee;
use ieee.std_logic_1164.all;

library primitive;
use primitive.primitive.all;


-- Beginning Test Bench Header

ENTITY p1 IS
    PORT (
	                   a :    in std_logic_vector (1 downto 0) ;
	                   b :    in std_logic_vector (1 downto 0) ;
	                   c :    in std_logic_vector (1 downto 0) ;
	                   d :    in std_logic_vector (1 downto 0) ;
	                 sel :    in std_logic_vector (1 downto 0) ;
	                 ref :    in std_logic_vector (1 downto 0) ;
	              salida : inout std_logic_vector (3 downto 0)
    );
END p1;

-- End of Test Bench Header

ARCHITECTURE DSMB of p1 is

	signal jed_node1	: std_logic:='0' ; -- sel(1)
	signal jed_node2	: std_logic:='0' ; -- sel(0)
	signal jed_node3	: std_logic:='0' ; -- ref(1)
	signal jed_node4	: std_logic:='0' ; -- ref(0)
	signal jed_node5	: std_logic:='0' ; -- d(1)
	signal jed_node6	: std_logic:='0' ; -- d(0)
	signal jed_node7	: std_logic:='0' ; -- c(1)
	signal jed_node8	: std_logic:='0' ; -- c(0)
	signal jed_node9	: std_logic:='0' ; -- b(1)
	signal jed_node10	: std_logic:='0' ; -- b(0)
	signal jed_node11	: std_logic:='0' ; -- a(1)
	signal jed_node12	: std_logic:='0' ;
	signal jed_node13	: std_logic:='0' ; -- a(0)
	signal jed_node15	: std_logic:='0' ;
	signal jed_node17	: std_logic:='0' ;
	signal jed_node18	: std_logic:='0' ;
	signal jed_node19	: std_logic:='0' ;
	signal jed_node20	: std_logic:='0' ;
	signal jed_node22	: std_logic:='0' ;
	signal jed_node24	: std_logic:='0' ;

	for all: c22v10m use entity primitive.c22v10m (sim);

SIGNAL  one:std_logic:='1';
SIGNAL  zero:std_logic:='0';
SIGNAL  jed_oept_1:std_logic:='0';
--Attribute PIN_NUMBERS of sel(1):SIGNAL is "0001";

SIGNAL  jed_oept_2:std_logic:='0';
--Attribute PIN_NUMBERS of sel(0):SIGNAL is "0002";

SIGNAL  jed_oept_3:std_logic:='0';
--Attribute PIN_NUMBERS of ref(1):SIGNAL is "0003";

SIGNAL  jed_oept_4:std_logic:='0';
--Attribute PIN_NUMBERS of ref(0):SIGNAL is "0004";

SIGNAL  jed_oept_5:std_logic:='0';
--Attribute PIN_NUMBERS of d(1):SIGNAL is "0005";

SIGNAL  jed_oept_6:std_logic:='0';
--Attribute PIN_NUMBERS of d(0):SIGNAL is "0006";

SIGNAL  jed_oept_7:std_logic:='0';
--Attribute PIN_NUMBERS of c(1):SIGNAL is "0007";

SIGNAL  jed_oept_8:std_logic:='0';
--Attribute PIN_NUMBERS of c(0):SIGNAL is "0008";

SIGNAL  jed_oept_9:std_logic:='0';
--Attribute PIN_NUMBERS of b(1):SIGNAL is "0009";

SIGNAL  jed_oept_10:std_logic:='0';
--Attribute PIN_NUMBERS of b(0):SIGNAL is "0010";

SIGNAL  jed_oept_11:std_logic:='0';
--Attribute PIN_NUMBERS of a(1):SIGNAL is "0011";

SIGNAL  jed_oept_13:std_logic:='0';
--Attribute PIN_NUMBERS of a(0):SIGNAL is "0013";

SIGNAL  jed_oept_14:std_logic:='0';
SIGNAL  jed_sum_14,jed_fb_14:std_logic:='0';
--Attribute PIN_NUMBERS of salida(1):SIGNAL is "0014";

SIGNAL  jed_oept_16:std_logic:='0';
SIGNAL  jed_sum_16,jed_fb_16:std_logic:='0';
--Attribute PIN_NUMBERS of salida(3):SIGNAL is "0016";

SIGNAL  jed_oept_21:std_logic:='0';
SIGNAL  jed_sum_21,jed_fb_21:std_logic:='0';
--Attribute PIN_NUMBERS of salida(2):SIGNAL is "0021";

SIGNAL  jed_oept_23:std_logic:='0';
SIGNAL  jed_sum_23,jed_fb_23:std_logic:='0';
--Attribute PIN_NUMBERS of salida(0):SIGNAL is "0023";

SIGNAL  jed_oept_25:std_logic:='0';
SIGNAL  jed_node25,jed_sum_25:std_logic:='0';
SIGNAL  jed_oept_26:std_logic:='0';
SIGNAL  jed_node26,jed_sum_26:std_logic:='0';

BEGIN
jed_node1 <= sel(1) ;
jed_node2 <= sel(0) ;
jed_node3 <= ref(1) ;
jed_node4 <= ref(0) ;
jed_node5 <= d(1) ;
jed_node6 <= d(0) ;
jed_node7 <= c(1) ;
jed_node8 <= c(0) ;
jed_node9 <= b(1) ;
jed_node10 <= b(0) ;
jed_node11 <= a(1) ;
jed_node13 <= a(0) ;
Mcell_14:c22v10m
generic map(comb,
   ninv,
   xpin,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	10 ns, --tar
	20 ns, --tap
	10 ns  --tspr
)
port map(
     d=>jed_sum_14,
     clk=>jed_node1,
     oe=>jed_oept_14,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>salida(1),
     fb=>jed_fb_14
   );

Mcell_16:c22v10m
generic map(comb,
   ninv,
   xpin,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	10 ns, --tar
	20 ns, --tap
	10 ns  --tspr
)
port map(
     d=>jed_sum_16,
     clk=>jed_node1,
     oe=>jed_oept_16,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>salida(3),
     fb=>jed_fb_16
   );

Mcell_21:c22v10m
generic map(comb,
   ninv,
   xpin,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	10 ns, --tar
	20 ns, --tap
	10 ns  --tspr
)
port map(
     d=>jed_sum_21,
     clk=>jed_node1,
     oe=>jed_oept_21,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>salida(2),
     fb=>jed_fb_21
   );

Mcell_23:c22v10m
generic map(comb,
   ninv,
   xpin,
   	15 ns, --tpd
	15 ns, --tea
	15 ns, --ter
	8 ns, --tco
	10 ns, --ts
	0 ns, --th
	6 ns, --twh
	6 ns, --twl
	4 ns, --tcf
	15 ns, --taw
	10 ns, --tar
	20 ns, --tap
	10 ns  --tspr
)
port map(
     d=>jed_sum_23,
     clk=>jed_node1,
     oe=>jed_oept_23,
     ss=>jed_sum_26,
     ar=>jed_sum_25,
     y=>salida(0),
     fb=>jed_fb_23
   );

jed_node25<=jed_sum_25;
jed_node26<=jed_sum_26;
jed_oept_14<=(one);

jed_sum_14<= ((one));

jed_oept_16<=(one);

jed_sum_16<= (((jed_node1) and (jed_node2) and (jed_node3) and (jed_node4)
 and not(jed_node6)) or
((jed_node1) and (jed_node2) and (jed_node4) and not(jed_node5)
 and not(jed_node6)) or
((jed_node1) and not(jed_node2) and (jed_node3) and (jed_node4)
 and not(jed_node8)) or
((jed_node1) and not(jed_node2) and (jed_node4) and not(jed_node7)
 and not(jed_node8)) or
(not(jed_node1) and (jed_node2) and (jed_node3) and (jed_node4)
 and not(jed_node10)) or
(not(jed_node1) and (jed_node2) and (jed_node4) and not(jed_node9)
 and not(jed_node10)) or
(not(jed_node1) and not(jed_node2) and (jed_node3) and (jed_node4)
 and not(jed_node13)) or
(not(jed_node1) and not(jed_node2) and (jed_node4) and not(jed_node11)
 and not(jed_node13)) or
((jed_node1) and (jed_node2) and (jed_node3) and not(jed_node5)
) or
((jed_node1) and not(jed_node2) and (jed_node3) and not(jed_node7)
) or
(not(jed_node1) and (jed_node2) and (jed_node3) and not(jed_node9)
) or
(not(jed_node1) and not(jed_node2) and (jed_node3) and not(jed_node11)
));

jed_oept_21<=(one);

jed_sum_21<= (((jed_node1) and (jed_node2) and not(jed_node4) and (jed_node5)
 and (jed_node6)) or
((jed_node1) and (jed_node2) and not(jed_node3) and not(jed_node4)
 and (jed_node6)) or
((jed_node1) and not(jed_node2) and not(jed_node4) and (jed_node7)
 and (jed_node8)) or
((jed_node1) and not(jed_node2) and not(jed_node3) and not(jed_node4)
 and (jed_node8)) or
(not(jed_node1) and (jed_node2) and not(jed_node4) and (jed_node9)
 and (jed_node10)) or
(not(jed_node1) and (jed_node2) and not(jed_node3) and not(jed_node4)
 and (jed_node10)) or
(not(jed_node1) and not(jed_node2) and not(jed_node4)
 and (jed_node11) and (jed_node13)) or
(not(jed_node1) and not(jed_node2) and not(jed_node3)
 and not(jed_node4) and (jed_node13)) or
((jed_node1) and (jed_node2) and not(jed_node3) and (jed_node5)
) or
((jed_node1) and not(jed_node2) and not(jed_node3) and (jed_node7)
) or
(not(jed_node1) and (jed_node2) and not(jed_node3) and (jed_node9)
) or
(not(jed_node1) and not(jed_node2) and not(jed_node3)
 and (jed_node11)));

jed_oept_23<=(one);

jed_sum_23<= ((one));

end DSMB;
