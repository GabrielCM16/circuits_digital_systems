entity mux2x4_bonito is
    port(
        c0  : in  bit_vector(3 downto 0);  -- Entrada de 4 bits (canal 0)
        c1  : in  bit_vector(3 downto 0);  -- Entrada de 4 bits (canal 1)
        sel : in  bit;                     -- Sinal de seleção (1 bit)
        zc  : out bit_vector(3 downto 0)   -- Saída de 4 bits
    );
end entity;


architecture comuta of mux2x4_bonito is
begin
    -- comando vhdl de seleção de sinais
    zc <= c0 when sel = '0' else c1;

end architecture;
