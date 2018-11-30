package body ProgramPackage is

   function init(blkIn : BlockPackage.Block) return Program is
      temp : Program;
   begin
      temp.blk := blkIn;
      return temp;
   end;
   
   
   procedure execute(self : in out Program) is
   begin
      self.blk.execute;
   end;
   

end ProgramPackage;
