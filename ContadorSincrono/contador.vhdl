library ieee;
use ieee.std_logic_1164.all;

-- Entidade principal do contador síncrono
entity contador is
    port(
        clock : in std_logic;                     -- clock do sistema
        reset : in std_logic;                     -- de reset 
        pr    : in std_logic;                     -- preset
        q     : out std_logic_vector(2 downto 0)  -- estado atual
    );
end contador;

-- contador
architecture contamento of contador is

    component ffjk is
        port(
            j, k   : in std_logic;                -- J e K do flip-flop
            clock  : in std_logic;                -- clock
            pr, cl : in std_logic;                -- Preset e Clear do flip-flop
            q, nq  : out std_logic                --  Q e Q negado
        );
    end component;

    component controle is
        port(
            q    : in std_logic_vector(2 downto 0); -- atual
            j, k : out std_logic_vector(2 downto 0) -- J e K para os flip-flops
        );
    end component;

    -- Declaração de sinais internos
    signal sq, snq : std_logic_vector(2 downto 0); -- Estado atual (sq) e seu complemento (snq)
    signal sj, sk  : std_logic_vector(2 downto 0); -- J e K para os flip-flops

begin
    u_controle : controle port map(sq, sj, sk);

    u_ffjk0 : ffjk port map(sj(0), sk(0), clock, reset, pr, sq(0), snq(0));
    u_ffjk1 : ffjk port map(sj(1), sk(1), clock, pr, reset, sq(1), snq(1));
    u_ffjk2 : ffjk port map(sj(2), sk(2), clock, pr, reset, sq(2), snq(2));

    q <= sq;

end architecture;
