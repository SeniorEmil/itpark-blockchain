pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract ToDoList {

    int8 public numTasks = 0;

    struct task {
        string name;
        uint32 timestamp;
        bool flag;    
    }

    mapping(int8 => task) tasksArray;

    constructor() public {

        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }



    //получить описание задачи по ключу
    function getTask(int8 num) public view returns(task) {
		tvm.accept();
        if (tasksArray.exists(num)){
            return tasksArray[num];
        }
    }

    //добавить задачу
    function addTask(string name) public returns(task) {
		tvm.accept();
        task newTask = task(name, now, false);
        numTasks++;
        tasksArray[numTasks] = newTask;
        return newTask;
	}

    //получить список задач    
    function getAllTasks() public view returns(mapping (int8=>task)) {
        tvm.accept();
        return tasksArray;
    }
    
    //удалить задачу по ключу
    function deleteTask(int8 num) public {
		tvm.accept();
        if (tasksArray.exists(num)){
           delete tasksArray[num];
        }
    }

    //отметить задачу как выполненную по ключу
    function markTaskCompletede(int8 num) public {
		tvm.accept();
        if (tasksArray.exists(num)){
           tasksArray[num].flag = true;
        }
    }
    
    function getNumTasks() public view returns(int8) {
        tvm.accept();
        return numTasks;
    }

}
