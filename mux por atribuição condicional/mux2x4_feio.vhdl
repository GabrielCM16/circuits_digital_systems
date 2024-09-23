entity mux2x4_feio is
    port(
        c03, c02, c01, c00  : in  bit;
        c13, c12, c11, c10  : in  bit;
        sel : in  bit;
        zc3, zc2, zc1, zc0  : out bit
    );
end entity;

architecture comuta of mux2x4_feio is
begin
    -- comando vhdl de seleção de sinais
    zc3 <= c03 when sel = '0' else c13;
    zc2 <= c02 when sel = '0' else c12;
    zc1 <= c01 when sel = '0' else c11;
    zc0 <= c00 when sel = '0' else c10;

end architecture;
