#Created by Björn Sevenhuijsen
#----------------------------------------------
#Change these file paths
$inputLocation='C:\Users\' + $env:UserName + '\Downloads\testng-results.xml'
$outputLocation='C:\Users\' + $env:UserName + '\Downloads\testResultsXRay.xml'

$xml=[xml](Get-Content $inputLocation)

$node=$xml.SelectSingleNode('//full-stacktrace')
while ($node -ne $null)
{
    $node.ParentNode.RemoveChild($node)
    $node = $xml.SelectSingleNode("//full-stacktrace")
}

$node=$xml.SelectSingleNode('//message')
while ($node -ne $null)
{
    $node.ParentNode.RemoveChild($node)
    $node = $xml.SelectSingleNode("//message")
}

$xml.Save($outputLocation)
