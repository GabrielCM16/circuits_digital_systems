entity pl_nor_tb is
    -- Entidade vazia
end pl_nor_tb;

architecture tb of pl_nor_tb is
    -- <subEntidade>
    component pl_nor is
        port(
            A : in  bit;
            B : in  bit;
            S : out bit
        );
    end component;

    -- <Sinais>
    signal sA, sB : bit;
    signal sNOR  : bit;

begin
    -- <mapeamento> posicional
    u2_pl_nor : pl_nor port map(sA, sB, sNOR);

    u3_tb : process
    begin
        -- linhas da tabela-verdade
        sA <= '0';
        sB <= '0';
        wait for 10 ns;

        sA <= '0';
        sB <= '1';
        wait for 10 ns;

        sA <= '1';
        sB <= '0';
        wait for 10 ns;

        sA <= '1';
        sB <= '1';
        wait for 10 ns;
        
        wait;        
    end process u3_tb;

end tb;
