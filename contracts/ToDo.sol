// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract ToDo {
  

  struct Task{
    uint id;
    uint date;
    string content;
    string author;
    bool done;
  }

  //Task[] tasks;
  uint lastTaskId;
  uint[] taskIds;
  mapping(uint => Task) tasks;
  //one way communication
  event TaskCreated(uint, uint, string, string, bool);
  constructor()  {
    lastTaskId = 0;
  }


  function createTask(string memory _content,string memory _author) public {
    lastTaskId++;
    tasks[lastTaskId]=Task(lastTaskId,block.timestamp,_content,_author,false);
    emit TaskCreated(lastTaskId, block.timestamp, _content, _author, false);
    taskIds.push(lastTaskId);
  
  }

  function getTask(uint id)  taskExists(id) public view  returns(uint,uint,string memory,string memory,bool )
  {
    
    return (
     id,
     tasks[id].date,
     tasks[id].content,
     tasks[id].author,
     tasks[id].done
    );
  }
  function getTaskIds() public view returns( uint[] memory)
  {
    return taskIds;
   
  }
  //by default internal
  modifier taskExists(uint id) {
      if(tasks[id].id == 0) {
        revert();
      }
      _;
    }

}
