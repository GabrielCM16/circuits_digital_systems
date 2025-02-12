library ieee;
use ieee.std_logic_1164.all;
 
entity tb_contador is
end tb_contador;

architecture testamento of tb_contador is

constant CLK_PERIOD : time := 20 ns;

component contador is
    port(
        clock : in std_logic;
        reset : in std_logic;
        pr    : in std_logic;
        q     : out std_logic_vector(2 downto 0)
    );
end component;

signal sclk : std_logic := '1';
signal sreset, spr : std_logic;
signal sq : std_logic_vector(2 downto 0);

begin

    u_contador : contador port map (sclk, sreset, spr, sq);

    tbp : process
    begin
        spr   <= '1';
        sreset <= '0';
        wait for CLK_PERIOD;

        sreset <= '1';
        wait for 8 * CLK_PERIOD;

        sreset <= '0';
        wait for CLK_PERIOD;

        sreset <= '1';
        wait for 2 * CLK_PERIOD;

        wait;
    end process tbp;

    clock : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process clock;

end architecture;