library ieee;
use ieee.std_logic_1164.all;

entity somador4bits is
    port(
    a    : in std_logic_vector(3 downto 0);
    b    : in std_logic_vector(3 downto 0);
    cin  : in std_logic;
    cout : out std_logic;
    s    : out std_logic_vector(3 downto 0)
    );
end entity;

architecture comportamento of somador4bits is

component somador1bit is
    port(
        a    : in std_logic;
        b    : in std_logic;
        cin  : in std_logic;
        cout : out std_logic;
        s    : out std_logic
    );
end component;

signal carry : std_logic_vector(2 downto 0);

begin
        u_somador0 : somador1bit port map(a(0), b(0), cin, carry(0), s(0));
        u_somador1 : somador1bit port map(a(1), b(1), carry(0), carry(1), s(1));
        u_somador2 : somador1bit port map(a(2), b(2), carry(1), carry(2), s(2));
        u_somador3 : somador1bit port map(a(3), b(3), carry(2), cout, s(3));
end architecture;