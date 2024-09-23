entity pl_or_2_tb is
	-- Entidade vazia  
end pl_or_2_tb;

architecture tb of pl_or_2_tb is
    -- <subEntidade>
    component pl_or_2 is
	    port(
		    A : in  bit;
		    B : in  bit;
		    S : out bit
	    );
    end component;

    -- <Sinais>
    signal sA, sB : bit;
    signal sOR    : bit;

begin

    -- <mapeamento> explícito
    --u1_pl_or_2 : pl_or_2 port map(A => sA, B => sB, S => sOR);

	-- <mapeamento> posicional
	u2_pl_or_2 : pl_or_2 port map(sA, sB, sOR);

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
