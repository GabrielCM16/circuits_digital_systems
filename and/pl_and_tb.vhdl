entity pl_and_tb is
    -- Entidade vazia  
end pl_and_tb;

architecture tb of pl_and_tb is
    -- <subEntidade>
    component pl_and is
        port(
            A : in  bit;
            B : in  bit;
            S : out bit
        );
    end component;

    -- <Sinais>
    signal sA, sB : bit;
    signal sAND   : bit;  -- Nome do sinal alterado para refletir a operação AND

begin

    -- <mapeamento> posicional
    u2_pl_and : pl_and port map(sA, sB, sAND);

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
