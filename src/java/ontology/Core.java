package ontology;

import org.semanticweb.owlapi.model.OWLOntologyCreationException;
import org.semanticweb.owlapi.model.OWLOntologyStorageException;

/**
 * Created by Jonas on 13/07/2015.
 */
public class Core {
    private static Core instance = new Core();
    private Core(){}
    public static Core getInstance() { return instance; }

    static final String baseOwl = "http://www.semanticweb.org/felipe/ontologies/2015/4/untitled-ontology-4";
    static final String fileName = "onto.owl";

    private IOntologyManager owlManager = getOntologyManagerInstance();

    public void insertClassInstance(String className, String id) throws OWLOntologyCreationException, OWLOntologyStorageException {
        owlManager.insertClassInstance(className, id);
        owlManager.saveOntology();
    }

    public void insertObjectPropertyInstance(String classId, String predicate, String objectId) throws OWLOntologyCreationException, OWLOntologyStorageException {
        owlManager.insertObjectPropertyInstance(classId, predicate, objectId);
        owlManager.saveOntology();
    }

    private IOntologyManager getOntologyManagerInstance(){
        try {
            return OntologyManager.getInstance(baseOwl, fileName);
        } catch (OWLOntologyCreationException e) {
            e.printStackTrace();
        }
        return null;
    }
}
