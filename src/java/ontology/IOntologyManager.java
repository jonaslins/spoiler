package ontology;

import org.semanticweb.owlapi.model.OWLOntologyStorageException;

import java.util.List;

public interface IOntologyManager {


	/**Insere uma instancia de uma classe na ontologia
     * @author Jonas Lins
     * @param className - nome da Classe da instancia a inserir
     * @param id - id da instancia
     */
	public void insertClassInstance(String className, String id);
	
	/**Insere uma tripla na ontologia
	 * Ex.: User:Pedro owl:liked owl:Avengers
     * @author Jonas Lins
     * @param classId - Classe da instancia
     * @param predicate - Predicado da tripla
     * @param objectId - Objeto da tripla
     */
	public void insertObjectPropertyInstance(String classId, String predicate, String objectId);

	/**Salva a ontologia no arquivo
     * @author Jonas Lins
	 * @throws OWLOntologyStorageException 
     */
	public void saveOntology() throws OWLOntologyStorageException;
	
	
	/**Muda o local do arquivo da ontologia
     * @author Jonas Lins
     */
	public void setFilePath(String filePath);

	public List<String> findMovieRecomendations();

}