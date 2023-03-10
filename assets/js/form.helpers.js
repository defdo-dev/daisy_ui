export const togglePassword = (e) => {
  const { input } = e.detail;
  if (!input) {
    console.error("Missing input node from detail parameter use the following code during the dispatch:\n")
    console.log("detail: %{input: \"#query_selector\"}")
    return
  }

  const sibling = document.querySelector(input)
  const children = [...e.target.children]

  children.map(node => {
    if (node.classList.contains("hidden")) {
      node.classList.remove("hidden")
      sibling.type = "password"
    } else {
      node.classList.add("hidden")
      sibling.type = "text"
    }
  })
}