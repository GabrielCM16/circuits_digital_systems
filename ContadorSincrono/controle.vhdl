library ieee;
use ieee.std_logic_1164.all;

entity controle is
    port(
        q    : in std_logic_vector(2 downto 0); -- Entradas atuais do flip-flop
        j, k : out std_logic_vector(2 downto 0) -- Saida de controle J e K
    );
end controle;

architecture logica_controle of controle is
begin
    -- Flip-flop 0: controla o bit menos significativo
    j(0) <= '1'; 
    k(0) <= not(q(2)) and q(1); 

    -- Flip-flop 1: controla o segundo bit
    j(1) <= q(0); 
    k(1) <= q(2) or not(q(0)); 

    -- Flip-flop 2: controla o bit mais significativo
    j(2) <= q(1) and not(q(0)); 
    k(2) <= not(q(0)) or q(1); 
end architecture;
