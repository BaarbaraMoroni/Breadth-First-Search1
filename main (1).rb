cidades = { 
    'Sibiu' => ['Oradea', 'Arad', 'Fagaras', 'Rimnicu Vilcea'],
    'Oradea' => ['Zerind', 'Sibiu'],
    'Neamt' => ['Iasi'],
    'Bucharest' => ['Fagaras', 'Pitesti', 'Giurgiu', 'Urziceni'],
    'Giurgiu' => ['Bucharest'],
    'Zerind' => ['Oradea', 'Arad'],
    'Mehadia' => ['Lugoj', 'Dobreta'],
    'Iasi' => ['Vaslui', 'Neamt'],
    'Fagaras' => ['Sibiu', 'Bucharest'],
    'Rimnicu Vilcea' => ['Sibiu', 'Craiova', 'Pitesti'],
    'Timisoara' => ['Arad', 'Lugoj'],
    'Dobreta' => ['Mehadia', 'Craiova'],
    'Hirsova' => ['Urziceni', 'Eforie'],
    'Craiova' => ['Dobreta', 'Rimnicu Vilcea', 'Pitesti'],
    'Vaslui' => ['Urziceni', 'Iasi']
    'Arad' => ['Zerind', 'Sibiu', 'Timisoara'],
    'Pitesti' => ['Rimnicu Vilcea', 'Craiova', 'Bucharest'],
    'Urziceni' => ['Bucharest', 'Hirsova', 'Vaslui'],
    'Eforie' => ['Hirsova'],
    'Lugoj' => ['Timisoara', 'Mehadia']
   
    
}

#recebe como parametro a cidade origem, cidade destino e as possibilidades de conexao
def procurar(origem, destino, cidades)
    visitados = [origem] #lista origem
    fila = [origem]#fila origem
    parentes = {} #armazenar o nó pai

    while fila.length > 0 #fila vazia
        no = fila.shift  #remocao e movimentação de nos
        if no == destino
            caminho = [no] #lista que armazena o caminho
            while caminho[0] != origem
                caminho.unshift(parentes[caminho[0]]) # construir o caminho do fim para o começo
            end
            return caminho # retorna caminho encontrado
        end
        cidades[no].select {|vizinho| !visitados.include?(vizinho)} #selecao vizinhos
                          .each do |vizinho|
            visitados.push(vizinho) #add vizinho
            fila.push(vizinho)
            parentes[vizinho] = no
        end
    end
    return nil #n econtra o caminho retorna
end

origem = 'Hirsova' #cidade de origem 
destino = 'Rimnicu Vilcea' # cidade de chegada

caminho = procurar(origem, destino, cidades) #se encontra 
puts "O caminho mais rápido entre #{origem} e #{destino} é 
#{caminho.join(' - ')}."
