-- Entidade
-- *Caixa Mágica em ótica externa, ou seja, suas conexões com o ambiente 
entity pl_and is
    port(
        A : in  bit;
        B : in  bit;
        S : out bit
    );
end pl_and;

-- Comportamento
-- é o que tem dentro da *Caixa Mágica 
architecture comportamento of pl_and is
begin
    S <= A and B; 
end comportamento;
