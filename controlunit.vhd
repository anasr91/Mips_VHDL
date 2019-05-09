----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:34:54 12/28/2016 
-- Design Name: 
-- Module Name:    controlunit - Behavioral 
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

entity controlunit is
     Port ( opcode : in  STD_LOGIC_VECTOR (5 downto 0);
            aluop : out  STD_LOGIC_VECTOR (1 downto 0);
            branch : out  STD_LOGIC;
            regdst : out  STD_LOGIC;
            alusrc : out  STD_LOGIC;
            memtoreg : out  STD_LOGIC;
            regwrite : out  STD_LOGIC;
            memread : out  STD_LOGIC;
            memwrite : out  STD_LOGIC);
end controlunit;

architecture Behavioral of controlunit is

begin

process(opcode)

begin

if(opcode = "000000") 
    then aluop <= "10";
         branch <= '0';
         regdst <= '1';
         alusrc <= '0';
         memtoreg <= '0';
         regwrite <= '1';
         memread <= '0';
         memwrite <= '0';
			
elsif(OpCode = "100011") 
       then  aluop <= "00";
             branch <= '0';
             regdst <= '0';
             alusrc <= '1';
             memtoreg <= '1';
             regwrite <= '1';
             memread <= '1';
             memwrite <= '0';

elsif(opcode = "101011")
       then aluop <= "00";
            branch <= '0';
            alusrc <= '1';
            regwrite <= '0';
            memread <= '0';
            memwrite <= '1';
				
elsif(opcode = "000100") 
       then aluop <= "01";
            branch <= '1';
            alusrc <= '0';
            regwrite <= '0';
            memread <= '0';
            memwrite <= '0';
				
		 
elsif(opcode = "001000") 
   	 then aluop <= "00";
            branch <= '0';
            alusrc <= '1';
            memtoreg <= '1';
            regwrite <= '1';
            memread <='1';
            memwrite <= '0';
            regdst <= '0';
				
end if  ;

end process ;



end Behavioral;

