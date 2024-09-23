entity pl_xnor_tb is
    -- Entidade vazia
end pl_xnor_tb;

architecture tb of pl_xnor_tb is
    -- <subEntidade>
    component pl_xnor is
        port(
            A : in  bit;
            B : in  bit;
            S : out bit
        );
    end component;

    -- <Sinais>
    signal sA, sB : bit;
    signal sXNOR : bit;

begin
    -- <mapeamento> posicional
    u2_pl_xnor : pl_xnor port map(sA, sB, sXNOR);

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
