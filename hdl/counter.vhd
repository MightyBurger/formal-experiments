library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
generic (
    GWIDTH: natural
);
port (
    clk: in std_logic;
    rst_n: in std_logic;
    arst_n: in std_logic;

    incr: in std_logic;
    decr: in std_logic;

    count: out unsigned(GWIDTH - 1 downto 0);
    empty: out std_logic;
    full: out std_logic
);
end counter;

architecture rtl of counter is

    constant COUNT_MIN: natural := 0;
    constant COUNT_MAX: natural := 2**GWIDTH - 1;

begin

    -- counter logic

    process(clk, arst_n)
    begin
        if arst_n = '0' then
            count <= (others => '0');
        elsif rising_edge(clk) then
            if rst_n = '0' then
                count <= (others => '0');
            else
                if incr = '1' and decr = '0' and full = '0' then
                    count <= count + 1;
                elsif decr = '1' and incr = '0' and empty = '0' then
                    count <= count - 1;
                end if;
            end if;
        end if;
    end process;

    -- status flags

    process(all)
    begin
        if count <= COUNT_MIN then
            empty <= '1';
        else
            empty <= '0';
        end if;
        if count >= COUNT_MAX then
            full <= '1';
        else
            full <= '0';
        end if;
    end process;

end architecture rtl;
