library ieee;
use ieee.std_logic_1164.all;

entity ffd is
    port(
        d : in std_logic;
        clock : in std_logic;
        pr, cl : in std_logic;
        q, nq : out std_logic
    );
end ffd;

architecture ff of ffd is
    signal s_snj , s_snk   : std_logic;
    signal s_sns , s_snr   : std_logic;
    signal s_sns2, s_snr2  : std_logic;
    signal s_eloS, s_eloR  : std_logic;
    signal s_eloQ, s_elonQ : std_logic;
    signal s_nClock        : std_logic;

begin
    -- clock negado
    s_nClock <= not(clock);

    --primeiro nand (entrada D e clock)
    s_snj <= not(d and clock and s_elonQ);

    --segundo nand
    s_snk <= not((not d) and clock and s_eloQ);

    --terceiro nand (preset e reset)
    s_sns <= not(pr and s_snj and s_eloR);

    -- quarto nand
    s_snr <= not(cl and s_snk and s_eloS);

    -- a ligacao entre o elo e o sinal
    s_eloS <= s_sns;
    s_eloR <= s_snr;

    -- quinto nand
    s_sns2 <= s_nClock nand s_sns;

    --sexto nand
    s_snr2 <= s_nClock nand s_snr;

    --setimo nand
    s_eloQ <= not (pr and s_sns2 and s_elonQ);

    --oitavo nand
    s_elonQ <= not (cl and s_snr2 and s_eloQ);

    --interligacao entre o elo e saida
    q <= s_eloQ;
    nq <= s_elonQ;

end architecture ff;
