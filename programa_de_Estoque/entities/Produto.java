package programa_de_Estoque.entities;

public class Produto {
    private String name;
    private double preco;
    private int quantidadeDeEstoque;

    public Produto(String name, double preco, int quantidadeDeEstoque) {
        this.name = name;
        this.preco = preco;
        this.quantidadeDeEstoque = quantidadeDeEstoque;
    }
    public double valorTotalEstoque(int quantidade){
        return preco*quantidade;
    }
    public void adicionarProduto(int quantidade){
        quantidadeDeEstoque+=quantidade;
    }
    public void retirarProduto(int quantidade){
        quantidadeDeEstoque-=quantidade;
    }
    public String toString() {
        return "produto{" +
                "name'=" + name + '\'' +
                ", preco=" + preco +
                ", quantidadeDeEstoque=" + quantidadeDeEstoque +
                '}';
    }
}