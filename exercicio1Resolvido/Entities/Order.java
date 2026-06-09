package exercicio1Resolvido.Entities;

import Enumeracao.entities.OrderStatus;

import java.util.Date;

public class Order {
    private Integer id;
    private Date moment;
    private exercicio1Resolvido.Entities.OrderStatus status;
    public Order(){
    }
    public Order(Integer id, Date moment, exercicio1Resolvido.Entities.OrderStatus status){
        this.id =id;
        this.moment =moment;
        this.status =status;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public Date getMoment() {
        return moment;
    }
    public void setMoment(Date moment) {
        this.moment = moment;
    }
    public exercicio1Resolvido.Entities.OrderStatus getStatus() {
        return status;
    }
    public void setStatus(exercicio1Resolvido.Entities.OrderStatus status) {
        this.status = status;
    }
    @Override
    public String toString() {
        return "Order [id=" + id + ", moment=" + moment +" status=" + status + "]";
    }
}