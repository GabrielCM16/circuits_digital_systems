library ieee;
use ieee.std_logic_1164.all;

entity fft is
    port(
        t      : in std_logic;       -- Entrada T
        clock  : in std_logic;       -- Clock
        pr, cl : in std_logic;       -- Preset e Clear
        q, nq  : out std_logic       -- Saídas Q e ~Q
    );
end fft;

architecture behavior of fft is
    signal n_clock : std_logic;      -- Clock invertido
    signal s_j, s_k : std_logic;     -- Entradas J e K
    signal s_eloS, s_eloR : std_logic;  -- Linhas SR intermediárias
    signal s_eloQ, s_elonQ : std_logic; -- Saídas Q e ~Q internas
begin

    -- Clock invertido
    n_clock <= not clock;

    s_j <= t;  
    s_k <= t;  

    process (n_clock, pr, cl)
    begin
        if cl = '0' then           
            s_eloQ <= '0';
            s_elonQ <= '1';
        elsif pr = '0' then       
            s_eloQ <= '1';
            s_elonQ <= '0';
        elsif rising_edge(clock) then
            if t = '1' then        
                s_eloQ <= not s_eloQ;
                s_elonQ <= not s_elonQ;
            end if;
        end if;
    end process;

    -- Saídas Q e ~Q
    q <= s_eloQ;
    nq <= s_elonQ;

end behavior;
