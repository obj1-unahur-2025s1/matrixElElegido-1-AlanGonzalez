object neo {
    var energia = 100
    method esElElegido() = true
    method saltar() { energia = energia / 2}
    method vitalidad() = energia * 0.10
}

object trinity {
    method vitalidad() = 0
    method esElElegido() = false
    method saltar() {}
}

object morfeo {
    var vitalidad = 8
    var estaDescansado = true
    method esElElegido() = false
    method saltar() { 
        estaDescansado = not estaDescansado
        vitalidad = (vitalidad - 1).max(0)
    }
    method vitalidad() = vitalidad
}

object nave {
    const pasajeros = #{neo, morfeo, trinity}
    method cantidadPasajero() = pasajeros.size()
    method mayorVitalidad() = pasajeros.max({p=>p.vitalidad()})
    method menorVitalidad() = pasajeros.min({p=>p.vitalidad()})
    method vitalidadEquilibrada() = self.mayorVitalidad().vitalidad() < self.menorVitalidad().vitalidad() * 2
    method estaElElegido() = pasajeros.any({p=>p.esElElegido()})

    method chocar() {
        pasajeros.forEach({p=>p.saltar()})
        pasajeros.clear()
    }

    method acelerar() { 
        pasajeros.filter({p=> not p.esElElegido()}).forEach({p=>p.saltar()})
        pasajeros.remove({neo})
    }
}