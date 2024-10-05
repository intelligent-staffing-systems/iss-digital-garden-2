import { pathToRoot } from "../util/path"
import { QuartzComponent, QuartzComponentConstructor, QuartzComponentProps } from "./types"
import { classNames } from "../util/lang"
import { i18n } from "../i18n"

const PageTitle: QuartzComponent = ({ fileData, cfg, displayClass }: QuartzComponentProps) => {
  const baseDir = pathToRoot(fileData.slug!)  // Dynamically compute the base URL

  return (
    <div class={classNames(displayClass, "page-title-container")}>
      {/* Use baseDir for dynamic link generation and only include the logo */}
      <a href={baseDir}>
        <img src="./static/logo.png" alt="Company Logo" class="logo" />
      </a>
    </div>
  )
}

PageTitle.css = `
.page-title-container {
  display: flex;
  align-items: center;
  justify-content: center; /* Center the logo */
  width: 100%; /* Ensure the container takes up full width */
  height: 100%; /* Ensure the container takes up full height */
}

.logo {
  width: 100%; /* Make the logo fill the width of the container */
  height: auto; /* Maintain the aspect ratio */
  cursor: pointer; /* Add a pointer cursor to indicate it's clickable */
}
.page-title {
  font-size: 1.75rem;
  margin: 0;
}
`

export default (() => PageTitle) satisfies QuartzComponentConstructor


