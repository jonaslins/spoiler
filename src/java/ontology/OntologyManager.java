package ontology;

import java.io.File;

import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.model.*;

public class OntologyManager implements IOntologyManager {

    private static OntologyManager instance = null;

    public static OntologyManager getInstance(String baseOWL, String filePath) throws OWLOntologyCreationException{
        if(instance!=null){
            return instance;
        }else{
            return instance = new OntologyManager(baseOWL,filePath);
        }
    }
    public static OntologyManager getInstance() {
        return instance;
    }
	
	private String filePath;
	private File file;
	private String baseOWL;
	private String prefix;
	private IRI ontologyIRIFile;
	private IRI ontologyIRIOwl;
	private OWLOntologyManager ontologyManager;
	private OWLOntology ontology;
	private OWLDataFactory dataFactory;
	private OntologyManager(String baseOWL) throws OWLOntologyCreationException{

		this.baseOWL = baseOWL;
		this.ontologyIRIOwl = IRI.create(this.baseOWL);
		this.prefix = "PREFIX owl: <"+baseOWL+"#> PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> ";

		this.ontologyManager = OWLManager.createOWLOntologyManager();

		this.ontology = this.ontologyManager.loadOntologyFromOntologyDocument(ontologyIRIFile);
		this.dataFactory = this.ontologyManager.getOWLDataFactory();
	}

	private OntologyManager(String baseOWL, String filePath) throws OWLOntologyCreationException{
		this.filePath = filePath;
		this.file = new File(filePath);
		this.ontologyIRIFile = IRI.create(file);

		this.baseOWL = baseOWL;
		this.ontologyIRIOwl = IRI.create(this.baseOWL);
		this.prefix = "PREFIX owl: <"+baseOWL+"#> PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> ";

		this.ontologyManager = OWLManager.createOWLOntologyManager();

		this.ontology = this.ontologyManager.loadOntologyFromOntologyDocument(ontologyIRIFile);
		this.dataFactory = this.ontologyManager.getOWLDataFactory();
	}

	public void insertClassInstance(String className, String id){
		OWLClass clas = this.dataFactory.getOWLClass(IRI.create(ontologyIRIOwl + "#" + className));
		OWLIndividual individual = this.dataFactory.getOWLNamedIndividual(IRI.create(ontologyIRIOwl + "#" + id));

		OWLClassAssertionAxiom axiom = this.dataFactory.getOWLClassAssertionAxiom(clas, individual);

		AddAxiom addAxiom = new AddAxiom(ontology, axiom);
		this.ontologyManager.applyChange(addAxiom);
	}

	public void insertObjectPropertyInstance(String classId, String predicate, String objectId){
		OWLIndividual individual = this.dataFactory.getOWLNamedIndividual(IRI.create(ontologyIRIOwl + "#" + classId));
		OWLObjectProperty pred = this.dataFactory.getOWLObjectProperty(IRI.create(ontologyIRIOwl + "#" + predicate));
		OWLIndividual object = this.dataFactory.getOWLNamedIndividual(IRI.create(ontologyIRIOwl + "#" + objectId));

		OWLObjectPropertyAssertionAxiom axiom = this.dataFactory.getOWLObjectPropertyAssertionAxiom(pred, individual, object);

		AddAxiom addAxiom = new AddAxiom(ontology, axiom);
		this.ontologyManager.applyChange(addAxiom);
	}

	public void saveOntology() throws OWLOntologyStorageException {
		this.ontologyManager.saveOntology(ontology);
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
		this.file = new File(this.filePath);
		this.ontologyIRIFile = IRI.create(file);
	}
	
	public String getPrefix() {
		return this.prefix;
	}
	
	public OWLOntology getOntology() {
		return this.ontology;
	}
	
	public OWLOntologyManager getOntologyManager() {
		return this.ontologyManager;
	}
}