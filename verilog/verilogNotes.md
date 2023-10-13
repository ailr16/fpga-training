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