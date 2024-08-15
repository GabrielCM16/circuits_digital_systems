-- Entidade
-- *Caixa Mágica em ótica externa, ou seja, suas conexões com o ambiente 
entity pl_or_2 is
	port(
		A : in  bit;
		B : in  bit;
		S : out bit
	);
end pl_or_2;

-- Comportamento
-- é o que tem dentro da *Caixa Mágica 
architecture comportamento of pl_or_2 is
begin
	S <= A or B; 
end comportamento;


