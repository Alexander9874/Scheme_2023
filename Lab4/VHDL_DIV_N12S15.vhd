library IEEE;
use IEEE.std_logic_1164.all;

entity VHDL_DIV_N12S15 is
    port (
        C, CE, CLR: in BIT;
        TC, CEO: out BIT;
        Q: buffer BIT_VECTOR (3 downto 0)
    );
end VHDL_DIV_N12S15;

architecture VHDL_DIV_N12S15_arch of VHDL_DIV_N12S15 is
begin
	process (CLR, C, CE)
	begin
		if CLR='1' then Q <= "0000";
		elsif CE='0' then null;
		elsif C'event and C='1' then
			case Q is
				when "0000" => Q <= "0001"; 
				when "0001" => Q <= "0010"; 
				when "0010" => Q <= "0011"; 
				when "0011" => Q <= "1000"; 
				when "1000" => Q <= "1001"; 
				when "1001" => Q <= "1010"; 
				when "1010" => Q <= "1011"; 
				when "1011" => Q <= "1100"; 
				when "1100" => Q <= "1101"; 
				when "1101" => Q <= "1110"; 
				when "1110" => Q <= "1111"; 
				when "1111" => Q <= "0000";
				when others => Q <= "0000";
			end case;
		end if;
	end process;
	TC <= Q(0) and Q(1) and Q(2);
	CEO <= Q(0) and Q(1) and Q(2) and CE; 
end VHDL_DIV_N12S15_arch;
