class sr_coverage extends uvm_subscriber #(sr_sequence_item);
  
`uvm_component_utils(sr_coverage)
  

   sr_sequence_item txn;
  
  
   covergroup dut_cov;
    option.per_instance= 1;
    option.comment     = "dut_cov";
    option.name        = "dut_cov";
    option.auto_bin_max= 4;
    
    l1:coverpoint txn.s ; 

    

    l2:coverpoint txn.r ;
     
    

    l3:cross l1,l2;
  endgroup:dut_cov;
  
    function new(string name="sr_coverage",uvm_component parent);
    super.new(name,parent);
    dut_cov=new();
  endfunction
  
    function void write(sr_sequence_item t);
    txn=t;
    dut_cov.sample();
      
    $display("---------------------------------------------");
      $display("coverage =%.2f %%",dut_cov.get_inst_coverage());
    $display("---------------------------------------------");
  endfunction
  

  

  
endclass:sr_coverage