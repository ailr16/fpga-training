# SystemVerilog Notes

## Simulation regions

![Sim regions](/verilog/MEDIA/simulationRegions.png)

### 1. Preponed Region
- Executed once
- The state of the signals is identical to the state of the *postponed* region of previous time slot
- Sampling values for any signal used in an assertion except the clock

### 2. Active Region
- Evaluation of:
    - Blocking assignments
    - RHS of Non-blocking assignments and schedule updates into the NBA region
    - Continuous assignments
    - Evaluation of inputs and update the output of primitives
    - Execute $display and $finish

### 3. Observed Region
- Evaluate concurrent assertions using the values sampled in the *Preponed region*
- During the property evaluation, the pass/fail code shall be scheduled in the *Reactive region* of the current time slot

### 4. Re-Active Region
- Evaluate and execute all current program activity in any order
- Execute all blocking statements
- Execute pass/fail code from concurrent assertions
- Evaluate RHS of all program nonblocking assignments
- Execute all program continuous assignments
- Execute $exit commands

### 5. Postponed Region
- Execute $strobe and $monitor commands that will show the final updated values for the current time slot


## Functions and Tasks

Use [**taskAndFunction**](/verilog/taskAndFunction/) exercise as reference
### Functions

- Has to return something (single value or expression, no void)
- Can't have output ports
- Can't return **more than one value**
- Can't have delays (#) so must be executed at zero time
- Can't contain @, wait, or xedge
- Don't consume simulation time
- May or may not take arguments
- Can't call another task

```v
function <return_type> function_name (arguments)
    ...
    return value
endfunction
```

### Tasks

- Don't return any value
- Can have output arguments
- Can contain delays (#) but that's not synthesizable
- May or may not consume simulation time
- Can call another function or task

```v
task task_name (arguments)
    ...
endtask
```