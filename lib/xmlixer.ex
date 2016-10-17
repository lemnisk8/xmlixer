defmodule Xmlixer do
def serialize(data) when is_list(data) do
    List.flatten(:xmerl.export_simple(data, :xmerl_xml))
  end

  def serialize(data) do
    List.flatten(:xmerl.export_simple([data], :xmerl_xml))
  end

  def create_node(tag, attributes \\ %{}, content \\ [])

  def create_node(tag, attributes, content) when is_atom(tag) do
    {tag, Map.to_list(attributes), content }
  end

  def create_node(tag, attributes, content) do
    {String.to_atom(tag), Map.to_list(attributes), content }
  end

  def add_attribute({tag, attrs, content}, attributes \\ %{}) do
    new_attrs = 
      attrs
      |> to_map
      |> Map.merge(attributes)
      |> Map.to_list
    {tag, new_attrs, content}
  end

  def add_attributes({tag, attrs, content}, attributes \\ %{}) do
    add_attribute({tag, attrs, content}, attributes)
  end

  def update_attributes({tag, attrs, content}, attributes) do
    add_attribute({tag, attrs, content}, attributes)
  end

  def update_attribute({tag, attrs, content}, attributes) do
    add_attribute({tag, attrs, content}, attributes)
  end

  def clear_attributes({tag, _, content}) do
    {tag, [], content}
  end

  def delete_attribute({tag, attrs, content}, attribute) when is_atom(attribute)do
    new_attrs = 
      attrs
      |> to_map
      |> Map.delete(attribute)
      |> Map.to_list
    {tag, new_attrs, content}
  end

  def add_content({tag, attrs, cont}, content) when is_tuple(content) do
    {tag, attrs, cont ++ [content]}
  end

  def add_content({tag, attrs, cont}, content) when is_list(content) do
    {tag, attrs, cont ++ content}
  end

  def add_content({tag, attrs, cont}, content) do
    {tag, attrs, [cont ++ [content]]}
  end

  def replace_content({tag, attrs, _}, content) when is_list(content) do
    {tag, attrs, [content]}
  end

  def replace_content({tag, attrs, _}, content) do
    {tag, attrs, [[content]]}
  end

  defp to_map(list) do
    Enum.into(list, %{})
  end
end
