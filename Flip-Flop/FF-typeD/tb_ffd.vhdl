library ieee;
use ieee.std_logic_1164.all;

entity tb_ffd is
    -- entidade vazia
end tb_ffd;

architecture test of tb_ffd is
    constant CLK_PERIOD : time := 20 ns;

    component ffd is
        port(
            d : in std_logic;
            clock : in std_logic;
            pr, cl : in std_logic;
            q, nq : out std_logic
        );
    end component;

    signal sd, spr, scl, sq, snq : std_logic;
    signal sclk : std_logic := '1';

begin
    -- Instancia do ff tipo D e port map
    u_ffd: ffd port map(sd, sclk, spr, scl, sq, snq);

    tbp : process
    begin
      
        spr <= '1';  -- Ativando o preset
        scl <= '0';  -- Desativando o clear
        sd <= '0';   -- Entrada D
        wait for CLK_PERIOD;

        spr <= '1';  -- Mantendo preset
        scl <= '1';  -- Ativando o clear
        sd <= '0';   -- Entrada D
        wait for CLK_PERIOD;

        spr <= '0';  -- Desativando preset
        scl <= '1';  -- Ativando clear
        sd <= '1';   -- Entrada D
        wait for CLK_PERIOD;

        spr <= '0';  -- Desativando preset
        scl <= '0';  -- Desativando clear
        sd <= '1';   -- Entrada D
        wait for CLK_PERIOD;

        spr <= '0';  -- Desativando preset
        scl <= '0';  -- Desativando clear
        sd <= '0';   -- Entrada D
        wait for CLK_PERIOD;

        spr <= '1';  -- Ativando preset
        scl <= '0';  -- Desativando clear
        sd <= '1';   -- Entrada D
        wait for CLK_PERIOD;

        wait;
    end process;

    p_clock : process
    begin
        while true loop
            sclk <= not(sclk);
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

end architecture test;
