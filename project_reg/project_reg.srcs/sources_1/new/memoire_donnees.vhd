----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2022 09:53:53
-- Design Name: 
-- Module Name: memoire_donnees - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memoire_donnees is
    Port ( 
           add : in STD_LOGIC_VECTOR (7 downto 0); --adresse de la zone mémoire
           input : in STD_LOGIC_VECTOR (7 downto 0);
           RW : in STD_LOGIC;
           RST : in STD_LOGIC;
           CLK : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (7 downto 0));
end memoire_donnees;

architecture Behavioral of memoire_donnees is
    type bancMem is array (0 to 15) of STD_LOGIC_VECTOR (7 downto 0); 
    --Initialisation du tableau
    signal memoire : bancMem:=(others => (others => '0'));
begin
    process 
    begin 
    
        --Attend le front montant de l'horloge
        wait until CLK'event and CLK='1';
        
        --Si le signal RST est actif (à 0)
        if (RST = '0') then
            -- initialise le contenu du banc à 0x00
            memoire(0 to 15) <= (others => X"00");
        end if;
        
        --Lecture
        if (RW = '1') then 
            --Lecture  
            output <= memoire(to_integer(unsigned(add))) ;
                    
        elsif (RW = '0') then         
            --Ecriture
            memoire(to_integer(unsigned(add))) <= input;
        end if;
        
        
    end process;


end Behavioral;
