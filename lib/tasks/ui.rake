require "fileutils"

namespace(:ui) do
  task(:build) do
    original_dir = FileUtils.pwd

    begin
      FileUtils.cd("agile-direction-ui")
      system("npm install")
      system("ember build")
    ensure
      FileUtils.cd(original_dir)
    end
  end
end
