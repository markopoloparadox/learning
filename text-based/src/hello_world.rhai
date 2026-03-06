const AGENT_ID = "EMPLOYEE_00";
const DIALOG_STATE_0 = 0;

fn init() {
    bb.agents[AGENT_ID] = #{};
    bb.agents[AGENT_ID].memories = #{};
    bb.agents[AGENT_ID].dialog = #{};
}

fn run() {
    let dialog_stage = bb.agents[AGENT_ID].dialog.stage;
    switch dialog_stage {
        () => {
            bb.agents[AGENT_ID].dialog.stage = DIALOG_STATE_0;
            dialog_stage_00!();
        }
    }
}

fn dialog_stage_00() {
    print("Hello");
    bb.agents[AGENT_ID].question = "Jak vám mohu pomoci?";
    bb.agents[AGENT_ID].answers = ["A", "B", "C", "D"];
}