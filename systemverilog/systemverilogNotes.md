# SystemVerilog Notes

## Data Types

### 2-state Data Types (0, 1)
|Type    | Additional info |
|--------|-----------------|
|bit     |                 |
|byte    |8b               |  
|shortint|16b              |
|int     |32b              |
|longint |64b              |

### 4-state Data Types (0, 1, x, z)
|Type    | Additional info |
|--------|-----------------|
|logic   |                 |
|reg     |                 |  
|integer |32b              |
|time    |65bU             |

### Logic Data Type
- Replace *reg*
- Use *net* with multiple drivers
- Use *logic* everywhere else
```v
logic data_wire, data_reg;
always_comb
    case (sel)
        1'b0 : data_wire = datain;
        1'b1 : data_wire = ~datain;
    endcase

always_ff @(posedge clk)
    data_reg <= datain;
```

### Casting
- Static casting: 
    - Converts one data type to another compatible data types
    - Not applicable to OOP
    - Use the ‘ operator
    ```v
    10´(x-2)            //Casting to change size
    int´(2.0 * 3.0)     //Casting to type int
    fruit´(0)           //Casting to enum fruit
    ```

### User-Defined Types
- Type definitions:
    ```v
    typedef int unsigned uint;
    typedef logic [15:0] main_bus;
    ```

- Type definitions:
    - Specific set of values
    ```v
    typedef enum bit {TRUE, FALSE} boolean;

    boolean rdy;

    assign eq_two = (datain == 2'b10) ? TRUE: FALSE;
    ```

### User-Defined Types - Structures
- Collection of different variables defined as a single name
    ```v
    typedef struct{
        logic       even;
        logic [7:0] parity;
    }par_struct;

    par_struct par_in, par_out;

    assign par_in = '{0, 8'h80};

    assign par_out.even   = 1'b1;
    assign par_out.parity = 8'h55;
    ```
### Arrays
- Collection of variables of same type defined as a single name
    ```v
    logic [7:0] data_mem [1:4][1:256];
    /*
    Data type
    Packed dimensions
    Array name
    Unpacked dimensions
    */
    assign  data_mem[1][100][7:0] = 8'h55;
    assign  data_mem[2][80:81] = '{8'h5, 8'ha};
    ```

### Array Reduction Methods
- Applicable to to any unpacked array to reducte it to a single value:
    - sum()
    - product()
    - and()
    - or()
    - xor()
    ```v
    byte data[2:0] = '{1, 3, 5};
    int result;

    assign result = data.sum;
    assign result = data.product;
    assign result = data.and;
    ```

### Unsized Integer Literals
- Example
    ```v
    module sv_test #(parameter REG_WIDTH = 8)
            ( input  clk, set,
              input  [REG_WIDTH-1:0] data_in,
              output [REG_WIDTH-1:0] data_out);
    
    logic [REG_WIDTH-1:0] data_reg,

    always_ff @ (posedge clk, posedge set)
        if(set)
            data_reg <= '1;     //Automatically scales regardless of the value of REG_WIDTH
        else
            data_reg <= data_in;

    assign data_out = data_reg;

    endmodule    
    ```

### Packages
Allows sharing across multiple modules:
- parameters
- types
- tasks
- functions
    ```v
    package global_defs;
        enum {IDLE, SOP, DATA_PYLD} pckt_state, nxt_pckt_state;
        typedef int unsigned uint;
        typedef logic [15:0] main_bus;
    endpackage
    ```

### Importing Packages
- Scope resolution operator ::
    ```v
    module main_ctl
        (input  global_defs::main_bus in_bus,
        output ...);
    ```
- Import globally
    ```v
    import global_defs::*;
    module main_ctl
        (input main_bus in_bus,
        output ...);
    ```
- Import locally into module
    ```v
    module main_ctl
        import global_defs::*;
        (input main_bus in_bus,
        output ...);
    ```

### Unsupported Data Types/Features
- Events
- Unions
- Class
- Queues

## Procedural Blocks

### always_ff
- Sequential logic
- Specify sensitivity list
- Outputs can't be assigned in another block
    ```v
    always_ff @(posedge clk, posedege rst) begin
        if (rst)
            pckt_state <= IDLE;
        else
            pckt_state <= nxt_pck_state;
    ```

### always_comb
- Model combinatorial logic
- Inferred sensitivity list
- Outputs can't be assigned in another block
- Evaluated at time zero
    ```v
    always_comb begin
        nxt_pckt_state = pckt_state;
        unique case (pckt_state)
            IDLE       : if (pkt_rdy)      nxt_pckt_state = SOP;
            SOP        :                   nxt_pckt_state = SOP;
            DATA_PYLD  : if (end_of_data)  nxt_pckt_state = CRC;
            CRC        : if (crc_done)     nxt_pckt_state = EOP;
            EOP        :                   nxt_pckt_state = IDLE;
        endcase
    end
    ```

### always_latch
- Model latched logic
- Inferred sensitivity list
- Outputs can't be assigned in another block
- Evaluate at time zero
    ```v
    always_latch
        if (data_enable)
            data_out_lat <= data_in;
    ```

## Procedural Statements

### Increment and Decrement Operators
- Up/down counter. Use in combinatorial blocks
    ```v
    always_comb
        begin
            cntr = cntr_value;
            if (up)
                cntr++;
            else if (down)
                cntr--;
        end
    ```

### Asignment Operators
- +=
- -=
- *=
- /=
- %=
- &=
- |=
- ^=
- <<==
- .>>==
- <<<===
- .>>>===

### Wild Equality and Inequality Operators
- ==?
- !=?
- Treats X or Z bits as don't cares
    ```v
    always_comb begin
        if ( arg ==? condition)
            ...
    end
    ```

### Jump Statements
- Break
    - Terminates loop execution
- Continue
    - Jumps to loop end
- Return
    - Task or function exits inmediately

### Block -names
```v
always_comb begin : write_registers     //Label
    ...
end : write_registers       //Same label
```

### Enhanced Case Statemens
- Unique
    - Only one case selected
    - Order is not relevant
    ```v
    always_comb begin
        unique case (addr[7:6])
            2'b00 : dma_ch_cs    = 1'b1;
            2'b01 : strt_addr_cs = 1'b1;
            2'b10 : dma_cnt_cs   = 1'b1;
            2'b11 : dma_ctrl_cs  = 1'b1;
        endcase
    ```
- Priority
    - At least one case select
    - Order is important
    ```v
    always_comb begin
        priority case (1'b1)
            irq_in[0] : irq_level = 3'b000;
            irq_in[1] : irq_level = 3'b001;
            irq_in[2] : irq_level = 3'b010;
            default   : irq_level = 3'b111;
        endcase
    ```

## State Machines

### Guidelines
- Assign default values to outputs derived from the SM
- Separate the SM logic from:
    - Arithmetic functions
    - Data paths
    - Output values
- If the design contains an operation used by more than one state, define the operation outside the SM and then use the value in the output logic of SM
- Reset System Flops with Async Resets
    ![Reset RTL](https://github.com/ailr16/fpga-training/blob/main/systemverilog/media/reset_RTL.png?raw=true)
    ```v
    module reset_gen(
        output rst_sync_n,
        input clk, rst_async_n);
    
        logic rst_s1, rst_s2;

        always_ff @ (posedge clk, negedge rst_async_n)
            if (~rst_async_n) begin
                rst_s1 <= 1'b0;
                rst_s2 <= 1'b0;
            end
            else begin
                rst_s1 <= 1'b1;
                rst_s2 <= rst_s1;
            end
        assign rst_sync_n = rst_s2;
    endmodule
    ```

### State Enconding with Enums
```v
//Default signed int (2-state)
enum {IDLE, SOP, DATA_PYLD} pckt_state, nxt_pckt_state;

//Unsigned int (2-state)
enum int unsigned {IDLE, SOP, DATA_PYLD} pckt_state, nxt_pckt_state;

//logic (4-state, 3 bit)
enum logic {IDLE, SOP, DATA_PYLD} pckt_state, nxt_pckt_state;

//logic set to one-hot (5 bit)
enum logic [4_0] {
    IDLE      = 5'b00001,
    SOP       = 5'b00010,
    DATA_PYLD = 5'b00100
    } pckt_state, nxt_pckt_state;
```

### State Machine Coding style
```v
enum logic [2:0] {IDLE, SOP, DATA_PYLD, CRC_EOP} pckt_state, nxt_pck_state;

always_ff @(posedge clk, posedge rst)
    if (rst)
        pck_state <= IDLE;
    else
        pckt_state <= nxt_pckt_state;
    
always_comb begin
    nxt_pckt_state = pckt_state;
    unique case (pckt_state)
        IDLE      : if(pck_rdy)     nxt_pckt_state = SOP;
        SOP       :                 nxt_pckt_state = SOP;
        DATA_PYLD : if(end_of_data) nxt_pckt_state = CRC;
        CRC       : if(crc_done)    nxt_pckt_state = EOP;
        EOP       :                 nxt_pckt_state = IDLE;
    endcase
end

assign sop_state = (pckt_state == SOP);
```

#### NOTE: Notes based in *SystemVerilog with the Quartus II Software, Altera, Intel training*