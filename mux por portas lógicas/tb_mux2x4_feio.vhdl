-- ghdl -a mux2x4_feio.vhdl tb_mux2x4_feio.vhdl
-- ghdl -r tb_mux2x4_feio --stop-time=20ns --wave=tb_mux2x4_feio.ghw

entity tb_mux2x4_feio is

end entity;

architecture comuta of tb_mux2x4_feio is
    component mux2x4_feio is
        port(
            c03, c02, c01, c00  : in  bit;
            c13, c12, c11, c10  : in  bit;
            sel : in  bit;
            zp3, zp2, zp1, zp0  : out bit
        );
    end component;

    signal sc03, sc02, sc01, sc00  : bit;
    signal sc13, sc12, sc11, sc10  : bit;
    signal ssel : bit;
    signal szp3, szp2, szp1, szp0  : bit;
begin

    u_mux2x4 : mux2x4_feio port map
    (sc03, sc02, sc01, sc00,    -- canal 0
     sc13, sc12, sc11, sc10,    -- canal 1
     ssel,                      -- seletor
     szp3, szp2, szp1, szp0);   -- saídas com P.Ls

    u_tb : process
    begin
        sc03 <= '0';
        sc02 <= '1';
        sc01 <= '1';
        sc00 <= '1';

        sc13 <= '1';
        sc12 <= '0';
        sc11 <= '0';
        sc10 <= '0';

        ssel <= '0';
        wait for 10 ns;

        ssel <= '1';
        wait for 10 ns;

        wait;
    end process;
    

end architecture;
