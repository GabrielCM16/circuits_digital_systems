library ieee;
use ieee.std_logic_1164.all;

entity tb_4bits is
end tb_4bits;

architecture test of tb_4bits is

component somador4bits is
	port(
	    a    : in std_logic_vector(3 downto 0);
            b    : in std_logic_vector(3 downto 0);
            cin  : in std_logic;
            cout : out std_logic;
            s    : out std_logic_vector(3 downto 0)
	);
end component;

signal sa, sb : std_logic_vector(3 downto 0);
signal scin   : std_logic;
signal ss     : std_logic_vector(3 downto 0);
signal scout  : std_logic;

begin
	u_somador : somador4bits port map(sa, sb, scin, scout, ss);

	tbp : process
    begin
         
	sa <= "1111";
	sb <= "0001";
	scin <= '0';
   	wait for 20 ns;

   	sa <= "1001";
	sb <= "0010";
	scin <= '0';
   	wait for 20 ns;

   wait;
    end process;
end architecture test;
