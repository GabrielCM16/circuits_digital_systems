entity pl_and_tb is
    -- Entidade vazia  
end pl_and_tb;

architecture tb of pl_and_tb is
    -- <subEntidade>
    component pl_and is
        port(
            A : in  bit;
            B : in  bit;
            C : in  bit;
            D : in  bit;
            S : out bit
        );
    end component;

    -- <Sinais>
    signal sA, sB, sC, sD : bit;
    signal sAND   : bit;  -- Nome do sinal reflete a operação AND

begin

    -- <mapeamento> posicional
    u2_pl_and : pl_and port map(sA, sB, sC, sD, sAND);  -- Corrigido para incluir todas as entradas

    u3_tb : process
    begin
        -- Testando todas as combinações das entradas
        sA <= '0'; sB <= '0'; sC <= '0'; sD <= '0';
        wait for 10 ns;

        sA <= '0'; sB <= '0'; sC <= '0'; sD <= '1';
        wait for 10 ns;

        sA <= '0'; sB <= '0'; sC <= '1'; sD <= '0';
        wait for 10 ns;

        sA <= '0'; sB <= '0'; sC <= '1'; sD <= '1';
        wait for 10 ns;

        sA <= '0'; sB <= '1'; sC <= '0'; sD <= '0';
        wait for 10 ns;

        sA <= '0'; sB <= '1'; sC <= '0'; sD <= '1';
        wait for 10 ns;

        sA <= '0'; sB <= '1'; sC <= '1'; sD <= '0';
        wait for 10 ns;

        sA <= '0'; sB <= '1'; sC <= '1'; sD <= '1';
        wait for 10 ns;

        sA <= '1'; sB <= '0'; sC <= '0'; sD <= '0';
        wait for 10 ns;

        sA <= '1'; sB <= '0'; sC <= '0'; sD <= '1';
        wait for 10 ns;

        sA <= '1'; sB <= '0'; sC <= '1'; sD <= '0';
        wait for 10 ns;

        sA <= '1'; sB <= '0'; sC <= '1'; sD <= '1';
        wait for 10 ns;

        sA <= '1'; sB <= '1'; sC <= '0'; sD <= '0';
        wait for 10 ns;

        sA <= '1'; sB <= '1'; sC <= '0'; sD <= '1';
        wait for 10 ns;

        sA <= '1'; sB <= '1'; sC <= '1'; sD <= '0';
        wait for 10 ns;

        sA <= '1'; sB <= '1'; sC <= '1'; sD <= '1';
        wait for 10 ns;

        wait;        
    end process u3_tb;

end tb;
