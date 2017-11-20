# LiteratureResearcher

An ILE (Integrated Literature research Environment) in Pharo.
Keep your bibliography as BibTex entries, PDFs, and a graph in Pharo.
Google Scholar is integrated for search by full-text, title, authors, and citing papers.
Scrapes PDFs from IEEE Xplore and ACM digital library.
Extracts metadata from PDFs.
Hyperlinks title, authors, and references in PDFs with the graph in Pharo.

## Demo

[See a short video here](https://youtu.be/EcK3Pt_WnEw)

[Prepared macOS Pharo](https://figshare.com/articles/LiteratureResearcher_All-in-one/5584837)

## Installation

Make sure you have `make`, the `Xcode command line tools`, `Java 8`, `Maven`, `python`, `virtualenv`, and `perl` installed.
Then run the following script in a playground:

```
Metacello new
	configuration: 'LiteratureResearcher';
	repository: 'github://maenu/LiteratureResearcher/pharo/repository';
	load
```

## Example

Run the following script in a playground and go.
Start searching for interesting stuff in the `Search` tab or the controller's inspector.

```
LiReController example
```
