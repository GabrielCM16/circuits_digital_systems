library ieee;
use ieee.std_logic_1164.all;

entity tb_fft is

end tb_fft;

architecture test of tb_fft is
    constant CLK_PERIOD : time := 20 ns;  
    component fft is
        port(
            t      : in std_logic;       -- Entrada T
            clock  : in std_logic;       -- Clock
            pr, cl : in std_logic;       -- Preset e Clear
            q, nq  : out std_logic       -- Saidas Q e ~Q
        );
    end component;
    signal st, spr, scl, sq, snq : std_logic; 
    signal sclk : std_logic := '1';           
begin
    u_fft: fft
        port map(
            t      => st,
            clock  => sclk,
            pr     => spr,
            cl     => scl,
            q      => sq,
            nq     => snq
        );

    tbp : process
    begin
        spr <= '1'; 
        scl <= '0'; 
        st <= '0';  
        wait for CLK_PERIOD;

        scl <= '1'; 
        st  <= '1'; 
        wait for CLK_PERIOD;

        st  <= '0'; -- T = 0
        wait for CLK_PERIOD;

        st  <= '1'; -- T = 1
        wait for CLK_PERIOD;

        spr <= '0'; 
        wait for CLK_PERIOD;

        scl <= '0';
        wait for CLK_PERIOD;

        scl <= '1'; 
        spr <= '1'; 
        st  <= '1'; -- T = 1
        wait for CLK_PERIOD;

        wait;
    end process;

    p_clock : process
    begin
        while true loop
            sclk <= not sclk;
            wait for CLK_PERIOD / 2;
        end loop;
    end process;
end architecture test;
