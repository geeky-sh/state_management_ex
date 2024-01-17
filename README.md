# StateManagement

The project contains usage of common tools used to manage state in elixir applications. While for commonly used object-oriented programming languages, state management is not an issue since we can use initialize singleton containers during the start of the application, elixir, by design, is a stateless language. Following are the most commonly used tools to manage state in Elixir:

1. Using Raw constructs
2. Using `Agent`
3. Using `GenServer`

Learning, understanding and using these tools provides a strong foundation for effectively working in Elixir.


## Using Raw Constructs
In elixir, we commonly create new processes that are responsible for managing the state. Here also for managing the data in memory, we create a separate process responsible for just keeping that data and listening for events that allow modifying that data. In case the return value is needed, this process will then send messages to the caller processes with the data.

To know more about how it is implemented you can check out `StateManagement.RawUser`. Tests for the corresponding module can be found at `StateManagement.RawUserTest`

## Use `Agent`
For simple state operations, `Agent` is commonly used since it provides a nice interface to manage the state.

To know more about how it is implemented, you can check out `StateManagement.AgentUser`. Tests for the corresponding module can be found at `StateManagement.AgentUserTest`

## Use `GenServer`
This is the most commonly used mode for managing states. Also, since it provides a nice interface to handle hosts of other operations, mastering `GenServer` is essential to work in the language.

To know more about how it is implemented, you can check out `StateManagement.GenserverUser`. Tests for the corresponding module can be found at `StateManagement.GenserverUserTest`

## Ref:
- [GenServer Docs](https://hexdocs.pm/elixir/GenServer.html)
- [Agent Docs](https://hexdocs.pm/elixir/agents.html)
