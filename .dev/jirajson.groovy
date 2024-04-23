import groovy.json.JsonBuilder
import groovy.io.FileType

class JiraProject {
    def key
    def name
    def issues
}

class JiraIssue {
    def summary
    def description
    def labels
}

if (!args) {
   println "Missing customer name"
   System.exit(1)
}	

// TODO Read from configuration
def projectName = "CoDeMaturity"
def projectKey = "CODE"
def labelPrefix = projectKey.toLowerCase()+'-'
def jiraProject = new JiraProject(key : projectKey, name : projectName, issues : [])

def findingDelim = "###"
def taskDelim = "####"

def snippetsRoot = new File("./_customer_details/"+args[0]+"/snippets")
def snippets = []

snippetsRoot.eachFile FileType.DIRECTORIES, { area ->
	snippetDir = new File(area.path)
	//println "snippetDir = " + snippetDir
	snippetDir.eachFileMatch(FileType.FILES, ~/.*md/) { snippet ->
		//println " - snippet = " + snippet
		def findings = new File(snippet.path).getText('UTF-8')
		if (findings.indexOf(findingDelim)>0) {
			// Skip the front matter and first delimiter ('###')
			findings = findings.substring(findings.indexOf(findingDelim)+4)

			def finding = findings.split(/\n(#{3} )/)
			finding.each { f ->
				def eol = f.indexOf("\n")
				def ftitle = f.substring(0, eol)
				//println "      [" + ftitle + "]"
				def fdescr = f.substring(eol + 1, f.indexOf(taskDelim)-1)
				//println "      [" + fdescr + "]"
				def tasks = f.substring(f.indexOf(taskDelim)+5)
				def t = tasks.split(/\n(#{4} )/)
				def labels = [labelPrefix+snippet.name.substring(0, snippet.name.length()-3), labelPrefix+area.name]
				t.each { task ->
					taskSummary = task.substring(0, task.indexOf("\n"))
					taskDescr = task.substring(task.indexOf("\n")+1).trim()
					taskDescr = taskDescr + "h1. Observation: " + ftitle + fdescr
					jiraProject.issues << new JiraIssue(
									summary: taskSummary,
									description: taskDescr,
									labels : labels
									)
				}
			}
		}
	}
}

def jsonBuilder = new JsonBuilder(projects : [ jiraProject ])
println(jsonBuilder.toPrettyString())

