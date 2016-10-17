# Xmlixer
A simple wrapper around erlang's xmerl to generate XML in elixir.

## Installation

The package can be installed as:

  1. Add `xmlixer` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:xmlixer, "~> 0.1.0"}]
    end
    ```

  2. Ensure `xmlixer` is started before your application:

    ```elixir
    def application do
      [applications: [:xmlixer]]
    end
    ```

### XML node is a tuple
```elixir
{Tag, %{Attribute}, [content]}
```
Tag can be a string or an atom.   
Attributes are Elixir Maps.   
Content can be a string, tuple (XML node) or a List tuples.   

## Usage
```elixir
  
```

## Example
```elixir
iex> import Xmlixer

#main xml
iex> fruits = create_node("fruits")
{:fruits, [], []}

#inner node
iex> apple = create_node("apple") |> add_attributes(
              %{color: "red", seeded: :true}
            ) |> add_content("give it to the doctor.")
{:apple, [color: "red", seeded: true], [["give it to the doctor."]]}

iex> fruits |> add_content(apple) |> serialize 
'<?xml version="1.0"?><fruits><apple color="red" seeded="true">give it to the doctor.</apple></fruits>'

```