library ieee;
use ieee.std_logic_1164.all;

entity tb_1bit is
end tb_1bit;

architecture test of tb_1bit is

component somador1bit is
	port(
			a    : in std_logic; 
			b    : in std_logic;
			cin  : in std_logic;
			cout : out std_logic;
			s    : out std_logic
	);
end component;

signal sa, sb, scin : std_logic;
signal scout, ss : std_logic;

begin
	u_somador : somador1bit port map(sa, sb, scin, scout, ss);

	tbp : process
    begin
         
	sa <= '1';
	sb <= '0';
	scin <= '0';
   	wait for 20 ns;

   	sa <= '0';
	sb <= '1';
	scin <= '0';
   	wait for 20 ns;

   wait;
    end process;
end architecture test;