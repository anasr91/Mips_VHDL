----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:54:38 11/10/2016 
-- Design Name: 
-- Module Name:    ALUOp - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALUOp is
    Port ( func : in  STD_LOGIC_VECTOR (5 downto 0);
           aluop : in  STD_LOGIC_VECTOR (1 downto 0);
           op : out  STD_LOGIC_VECTOR (3 downto 0));
end ALUOp;

architecture Behavioral of ALUOp is

begin

process(aluop,func)

begin

if(aluop="00")
   then op <= "0010";
	
elsif(aluop = "01")
   then op <= "0110";
	
elsif(aluop = "10")
   then
   if(func = "100000")
      then op <= "0010";

   elsif(func = "100010")

      then op <= "0110";

   elsif(func = "100100")
      then op <= "0000";

   elsif(func = "100101")
      then op <= "0001";

   elsif(func = "101010")
      then op <= "0111";

   end if;

end if;	
	
end process;
end behavioral;