// File: iss-explorer-config.ts

import { Options } from "./quartz/components/ExplorerNode"

// Custom sort function to order our content
export const sortFn: Options["sortFn"] = (a, b) => {
  const order = {
    "Home": 0,
    "Our Services": 100,
    "Custom AI Development": 101,
    "ISS-Setter for Teams": 102,
    "Enterprise AI Integration": 103,
    "Bespoke Communication Ecosystems": 104,
    "AI Consultation and Strategy": 105,
    "Case Studies": 200,
    "About ISS": 300,
    "Contact Us": 400,
    "Blog": 500
  }

  const orderA = order[a.name] ?? 1000
  const orderB = order[b.name] ?? 1000

  return orderA - orderB
}

// Custom filter function to exclude certain pages
export const filterFn: Options["filterFn"] = (node) => {
  const excludedPages = new Set(["tags", "private", "drafts"])
  return !excludedPages.has(node.name.toLowerCase())
}

// Custom map function to add icons to our explorer items
export const mapFn: Options["mapFn"] = (node) => {
  const icons = {
    "Home": "🏠",
    "Our Services": "🛠️",
    "Custom AI Development": "🧠",
    "ISS-Setter for Teams": "👥",
    "Enterprise AI Integration": "🏢",
    "Bespoke Communication Ecosystems": "💬",
    "AI Consultation and Strategy": "📊",
    "Case Studies": "📘",
    "About ISS": "ℹ️",
    "Contact Us": "📞",
    "Blog": "✍️"
  }

  if (icons[node.name]) {
    node.displayName = `${icons[node.name]} ${node.displayName}`
  }
}

// Export the custom Explorer configuration
export const ISSExplorerConfig = {
  title: "ISS Navigator",
  folderDefaultState: "open",
  sortFn,
  filterFn,
  mapFn,
  order: ["sort", "filter", "map"]
}
