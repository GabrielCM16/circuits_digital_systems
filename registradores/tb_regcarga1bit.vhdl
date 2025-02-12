library ieee;
use ieee.std_logic_1164.all;

entity tb_regcarga is
end entity;
 
architecture teste of tb_regcarga is
    constant CLK_PERIOD : time := 20 ns;
    component regcarga is
        port(
        d : in std_logic;
        clk : in std_logic;
        pr, cl : in std_logic;
        nrw : in std_logic;
        s : out std_logic
        );
    end component;
    signal s_d,s_pr,s_cl,s_nrw,s_s : std_logic;
    signal s_clk : std_logic := '0';
    begin
    u_regc : regcarga port map(s_d,s_clk,s_pr,s_cl,s_nrw,s_s);
    u_tb : process
           begin
--caso 0
                s_pr <= '0';
                s_cl <= '1';
                s_d  <= '0';
wait for CLK_PERIOD;
--caso 1
                s_pr <= '1';
                s_cl <= '1';
                s_d <=  '0' ;
wait for CLK_PERIOD;
--caso 2
                s_pr <= '1';
                s_cl <= '1';
                s_d  <= '1';
wait for CLK_PERIOD;
        end process;

p_clock_n : process
        begin
            s_clk <= not(s_clk);
            wait for CLK_PERIOD/2;
        end process;
end architecture;
