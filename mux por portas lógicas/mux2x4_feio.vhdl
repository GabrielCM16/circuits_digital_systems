entity mux2x4_feio is
    port(
        c03, c02, c01, c00  : in  bit;
        c13, c12, c11, c10  : in  bit;
        sel : in  bit;
        zp3, zp2, zp1, zp0  : out bit
    );
end entity;

architecture comuta of mux2x4_feio is
begin
    -- usando portas lógicas
    zp3 <= (c03 and not(sel)) or (c13 and sel); -- 4 x mux2x1
    zp2 <= (c02 and not(sel)) or (c12 and sel);
    zp1 <= (c01 and not(sel)) or (c11 and sel);
    zp0 <= (c00 and not(sel)) or (c10 and sel);

end architecture;
